# shell script for setup

## Ansible

debug

```sh
vagrant up
```

production

```sh
cd playbooks
ansible-playbook -i inventory/local.yml setup.yml
```
