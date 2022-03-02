# arpwatch

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with arpwatch](#setup)
    * [Beginning with arpwatch](#beginning-with-arpwatch)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)
1. [Release Notes](#release-notes)

## Description

Install and configure arpwatch

## Setup

### Beginning with arpwatch

`include ::arpwatch` is enough to get you up and running.

## Usage

All interaction with the arpwatch module is done through the main arpwatch class. You can simply set the options in `::arpwatch` to have full functionality of the module.

## Reference

### Classes

#### Public Classes

* arpwatch: Main class, installs and configures arpwatch

#### Private Classes

* arpwatch::params: Determines and sets the defaults used by the main arpwatch class

### Parameters

The following parameters are available in the `::arpwatch` class:

#### `config_file`

Specifies a file for arpwatch's configuration. Valid options: string containing an absolute path. Default value: '/etc/sysconfig/arpwatch'

#### `config_template`

Specifies a file to act as a ERB template for the config file. Valid options: string containing a path (absolute, or relative to the module path). Example value: 'arpwatch/conf.rhel.erb'

#### `dest_email`

Specifies the email address to send arpwatch alerts to. Valid options: string. Default value: '-' (suppresses all email output from arpwatch)

#### `interface`

Specifies the interface to monitor for arp changes. Valid options: string containing an interface name. Default: eth0

#### `opts`

Specify additional options to pass to arpwatch at start. Valid options: string of command line options. Default: OS dependant

#### `package_ensure`

Tells Puppet whether the arpwatch package should be installed, and what version. Valid options: 'present', 'latest', or a specific version number. Default value: 'present'

#### `package_name`

Tells Puppet what arpwatch package to manage. Valid options: string. Default value: 'arpwatch'

#### `service_enable`

Tells Puppet whether to enable the arpwatch service at boot. Valid options: true or false. Default value: true

#### `service_ensure`

Tells Puppet whether the arpwatch service should be running. Valid options: 'running' or 'stopped'. Default value: 'running'

#### `service_name`

Tells Puppet what arpwatch service to manage. Valid options: string. Default value: 'arpwatch'

#### `service_user`

Specifies which user account arpwatch should run under. Valid options: string. Default value: 'arpwatch' ('pcap' under RHEL5)

#### `source_email`

Specifies the source email address for arpwatch emails. Only works under RedHat family distributions. Valid options: string. Default value: 'arpwatch@${::fqdn}'

## Limitations

This module currently supports RedHat and Debian distributions. It has only been thoroughly tested under RedHat.
Pull requests are welcome to add support for other platforms.

## Development

Pull requests are welcome. Please make sure to properly document any additions or changes made to the module.
