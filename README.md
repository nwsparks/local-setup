This is just a way of keeping track of local setup for WSL and Windows.

Only works with Ubuntu on WSL

### Pre-Reqs

1. Install WSL. **Use Ubuntu 20.04** - https://docs.microsoft.com/en-us/windows/wsl/install-win10

2. Fix WSL Permissions, run this in WSL.

```
sudo tee "/etc/wsl.conf" > /dev/null <<'EOF'
[automount]
options = "metadata,umask=22,fmask=11"
EOF
```

3. Close WSL then in windows `restart-service lxssManager`. This is necessary for WSL to pickup the file system change.

4. Install Ansible

```
apt update
apt install python3-pip
pip3 install ansible
```

5. Run the ansible role

```
cd ansible
ansible-playbook setup.local.yml
```


### Quick and dirty

#install terraform
cd /tmp/
wget -O /tmp/tf.zip https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip
unzip tf.zip
sudo chmod +x terraform
sudo mv terraform /usr/local/bin/terraform
terraform version
