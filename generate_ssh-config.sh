sed -i "s/ //g" test.txt
bastion_host="$(grep -i  bastion_public_ip test.txt | cut -d= -f2)"
sandbox_host="$(grep sandbox_private_ip test.txt | cut -d= -f2)"
proxy_host="$(grep proxy_public_ip test.txt | cut -d= -f2)"
echo "$sandbox_host"
sed  -i "s/var_kpdi_"$1"_bastion/$bastion_host/g"  ssh.cfg ~/.ssh/config
sed -i "s/var_kpdi_"$1"_sandbox/$sandbox_host/g"  ssh.cfg ~/.ssh/config
sed -i "s/var_kpdi_"$1"_proxy/$proxy_host/g"  ssh.cfg     ~/.ssh/config
sed -i "s/ var_server_ip/$sandbox_host/g"   environments/"$1"/group_vars/main.yml

rm test.txt
