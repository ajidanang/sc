#!/bin/bash
# Proxy For Edukasi & Imclass
# ==============================

# Getting Proxy Template
wget -q -O /usr/local/bin/edu-tls "https://raw.githubusercontent.com/lesta-1/sc/main/edu1.py"
chmod +x /usr/local/bin/edu-tls

# Installing Service
cat > /etc/systemd/system/edu-tls.service << END
[Unit]
Description=Python Edu Tls By Wisang
Documentation=https://rpj08.my.id
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/edu-tls
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable edu-tls
systemctl restart edu-tls

clear

#!/bin/sh -e
# wstunnel
# By default this script does nothing
exit 0
END
