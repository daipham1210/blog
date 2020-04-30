# nephelaiio.rbenv

[![Build Status](https://travis-ci.org/nephelaiio/ansible-role-rbenv.svg?branch=master)](https://travis-ci.org/nephelaiio/ansible-role-rbenv)
[![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-nephelaiio.rbenv-blue.svg)](https://galaxy.ansible.com/nephelaiio/rbenv/)

An [ansible role](https://galaxy.ansible.com/nephelaiio/rbenv) to install and configure rbenv

## Role Variables

Please refer to the [defaults file](/defaults/main.yml) for an up-to-date list of input parameters.

Set ```rbenv_ruby``` to a ruby version to perform automatic installation; set ```rbenv_ruby_path``` additionally in order to create a symlink to the newly installed ruby version.
Set ```rbenv_bash_conf``` to true in order to configure the ansible connecting user bash profile to use rbenv binaries


## Example Playbook

```
    - hosts: servers
      roles:
         - role: rbenv
           rbenv_ruby: 2.4.1
           rbenv_ruby_path: /tmp/ruby2.4.1
```

## Testing

Role is tested against the following distributions (docker images):
  * Ubuntu Xenial
  * CentOS 7
  * Debian Stretch
  * Arch Linux

You can test the role directly from sources using command ` molecule test `

## License

This project is licensed under the terms of the [MIT License](/LICENSE)
