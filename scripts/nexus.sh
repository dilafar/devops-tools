yum update
yum install openjdk-8-jre-headless
yum install net-tools

cd /opt
wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz
tar -xzvf latest-unix.tar.gz

useradd nexus
chown -R nexus:nexus nexus-3.65.0-02
chown -R nexus:nexus sonatype-work

vim nexus-3.65.0-02/bin/nexus.rc
run_as_user="nexus"

su - nexus
/opt/nexus-3.65.0-02/bin/nexus start

ps aux | grep nexus
netstat -lnpt

# enabling systemctl (starting using systemctl)
sudo vim /etc/systemd/system/nexus.service

[Unit]
Description=nexus service
After=network.target
[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
User=nexus
Restart=on-abort
[Install]
WantedBy=multi-user.target

# restart nexus (when using systemctl)
sudo systemctl daemon-reload
sudo systemctl start nexus
sudo systemctl enable nexus