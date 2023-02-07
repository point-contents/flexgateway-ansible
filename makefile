playbook = playbook.yml
inventory = inventory.yml
tags_flag = --tags
vault_flat = --ask-vault-pass

ansible = ansible-playbook -i ${inventory} ${playbook} ${tags_flag}

debug:
	mv logs/ansible.log logs/ansible.old
	${ansible} "all,debug" -vv --check

patch:
	${ansible} update

user:
	${ansible} user

firewall:
	${ansible} firewall

nginx:
	${ansible} nginx

haproxy:
	${ansible} haproxy ${vault_flat}

tags:
	${ansible} all --list-tags

tasks:
	${ansible} all --list-tasks

all:
	${ansible} all
