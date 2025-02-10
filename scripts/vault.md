sudo certbot certonly --manual --preferred-challenges=dns --key-type rsa \
    --email fadhilahamed99@gmail.com --server https://acme-v02.api.letsencrypt.org/directory \
    --agree-tos -d *.cncloudnet.com

Certificate is saved at: /etc/letsencrypt/live/cncloudnet.com/fullchain.pem
Key is saved at:         /etc/letsencrypt/live/cncloudnet.com/privkey.pem


free -m
top
#DRY-RUN
certbot certonly --dry-run --manual --preferred-challenges=dns --key-type rsa \
    --email fadhilahamed99@gmail.com --server https://acme-v02.api.letsencrypt.org/directory \
    --agree-tos -d *.cncloudnet.com


apt update && apt install -y unzip net-tools

wget https://releases.hashicorp.com/vault/1.18.0/vault_1.18.0_linux_amd64.zip
unzip vault_1.18.0_linux_amd64.zip
cp vault /usr/bin/vault
mkdir -p /etc/vault
mkdir -p /var/lib/vault/data
vault version

vim config.hcl
cp config.hcl /etc/vault/config.hcl

vim /etc/systemd/system/vault.service

sudo systemctl daemon-reload
sudo systemctl stop vault
sudo systemctl start vault
sudo systemctl enable vault
sudo systemctl status vault --no-pager

ps -ef | grep -i vault | grep -v grep

export VAULT_ADDR=https://kmsvault.cncloudnet.com:8200
echo "export VAULT_ADDR=https://kmsvault.cncloudnet.com:8200" >>~/.bashrc

vault operator init | tee -a /etc/vault/init.file