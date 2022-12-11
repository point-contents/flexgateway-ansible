playbook = playbook.yml
inventory = inventory.yml
command = ansible-playbook
tags_flag = --tags
composed_command = ${command} -i ${inventory} ${playbook} ${tags_flag}

debug: SHELL:=/bin/bash 
debug:
	mv logs/ansible.log logs/ansible.old
	${composed_command} "all,debug" -vv --check

patch:
	${composed_command} update

user:
	${composed_command} user

firewall:
	${composed_command} firewall

flex:
	${composed_command} flex

nginx:
	${composed_command} nginx

haproxy:
	${composed_command} haproxy

tags:
	${composed_command} all --list-tags

tasks:
	${composed_command} all --list-tasks

all:
	${composed_command} all
