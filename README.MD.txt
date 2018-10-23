ansible.cfg file
1. Update with ssh.cfg file setting
2. ssh.cfg file - It has all the server details.
3 Make sure to update the DNS configuration in Route 53 and provide the correct IP


Variable file
1. - environments/{{ env }}//group_vars//main.yml - all environment specific variables are specified in this file

Inventory file
1. environments/{{ env }}//inventory/hosts

ROLES-
1. Web - This role is used to install apache with all the configurations. All templates are stored under templates folder.

NGINX
Update the below variables as per your details
domain_name: "devopstest1.kpd-i.com"
letsencrypt_email: "ngupta@kpd-i.com"
server_ip: "11.0.2.248"

1. Add User
2. Delete User - For delete user you have to remove the entry from the add user details and make a new entry in deleteusers.yaml file

How to run the playbook
ansible-playbook main.yml -i environments/dev/inventory/hosts --extra-vars env=dev
