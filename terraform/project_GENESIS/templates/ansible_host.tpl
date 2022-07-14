[app]
%{ for ip in app_ips  ~}
${ip}
%{ endfor ~}


[app:vars]
ansible_ssh_user = ${ansible_ssh_user}
ansible_ssh_private_key_file = ${ansible_ssh_private_key_file}
