#!/bin/bash
#installer Websocket tunneling 

cd

# Getting Proxy Template Ssl
wget -q -O /usr/local/bin/edu-proxyssl https://raw.githubusercontent.com/lesta-1/sc/main/proxy-templatedssl.py
chmod +x /usr/local/bin/edu-proxyssl

# Installing Service
cat > /etc/systemd/system/edu-proxyssl.service << END
[Unit]
Description=Python Edu Ssl Proxy By Radenpancal Service
Documentation=https://rpj08.my.id
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/edu-proxyssl 109
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable edu-proxyssl
systemctl restart edu-proxyssl

clear

# Getting Proxy Template Ovpn
wget -q -O /usr/local/bin/edu-proxyovpn https://raw.githubusercontent.com/lesta-1/sc/main/proxy-templatedovpn.py
chmod +x /usr/local/bin/edu-proxyovpn

# Installing Service
cat > /etc/systemd/system/edu-proxyovpn.service << END
[Unit]
Description=Python Edu Ovpn Proxy By Radenpancal Service
Documentation=https://rpj08.my.id
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/edu-proxyovpn 2086
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable edu-proxyovpn
systemctl restart edu-proxyovpn

clear

# nano /etc/bin/wstunnel
cat > /etc/bin/wstunnel <<-END
#!/bin/sh -e
# wstunnel
# By default this script does nothing
exit 0
END
