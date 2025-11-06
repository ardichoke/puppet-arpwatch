#
# Install and configure arpwatch
#
# @example Basic installation and configuration of arpwatch
#   include ::arpwatch
#
# @example Install service and set it to send email alerts
#   class { 'arpwatch':
#     dest_email    => 'foo@bar.org',
#     source_email  => 'arpwatch@baz.com',
#   }
#
# @param [String] config_file The configuration file on the server to manage.
# @param [String] config_template The template to use when generating the config file
# @param [String] dest_email The email address to send arpwatch alerts to.
# @param [String] interface Which interface to watch for arp traffic
# @param [String] opts Additional command line options to pass to arpwatch at start
# @param [String] package_ensure Ensure value passed to the package resource
# @param [String] package_name Name of the package to manage
# @param [Boolean] service_enable Enable value, passed to the service resource
# @param [String] service_ensure Ensure value, passed to the service resource
# @param [String] service_name Name of the service to manage
# @param [String] service_user Defines the user account that arpwatch will run under
# @param [String] source_email Define the source email address for arpwatch alerts
#
class arpwatch (
  Stdlib::Unixpath        $config_file = '/etc/default/arpwatch',
  String[1]               $config_template = 'arpwatch/conf.deb.erb',
  String[1]               $dest_email = '-',
  String[1]               $interface = 'eth0',
  String[1]               $opts = '-N -p',
  Stdlib::Ensure::Package $package_ensure = 'installed',
  String[1]               $package_name = 'arpwatch',
  Boolean                 $service_enable = true,
  Stdlib::Ensure::Service $service_ensure = 'running',
  String[1]               $service_name = 'arpwatch@eth0',
  String[1]               $service_user = 'arpwatch',
  Stdlib::Email           $source_email = "arpwatch@${fact('networking.fqdn')}",
  ) {
    package {
      $package_name:
      ensure => $package_ensure,
    }
    file {
      $config_file:
      ensure  => 'file',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template($config_template),
    }
    service {
      $service_name:
      ensure => $service_ensure,
      enable => $service_enable,
    }
    Package[$package_name]
    -> File[$config_file]
    ~> Service[$service_name]
}
