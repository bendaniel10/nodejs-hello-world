ansible-galaxy install weareinteractive.environment
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .ansible/jenkins_inventory.txt .ansible/jenkins_playbook.yml --extra-vars="ansible_ssh_private_key_file=jenkins.pem"