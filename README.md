# shell script for setup

## requirements

- ansible

## Ansible

debug

```sh
vagrant up
```

production

```sh
cd playbooks
ansible-playbook --ask-become-pass -i inventory/local.yml setup.yml
```
