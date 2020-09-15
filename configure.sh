#!/bin/sh
# Download and install V2Ray
echo  "go here for test"

mkdir /tmp/v2ray
curl -L -H "Cache-Control: no-cache" -o /tmp/v2ray/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip /tmp/v2ray/v2ray.zip -d /tmp/v2ray
#rm before install
rm -rf /usr/local/bin/v2ray
rm -rf /usr/local/bin/v2ctl
rm -rf /usr/local/etc/v2ray
#install new
install -m 755 /tmp/v2ray/v2ray /usr/local/bin/v2ray
install -m 755 /tmp/v2ray/v2ctl /usr/local/bin/v2ctl
# Remove temporary directory
rm -rf /tmp/v2ray

# V2Ray new configuration
install -d /usr/local/etc/v2ray
cat << EOF > /usr/local/etc/v2ray/config.json
{
    "inbounds": [
        {
            "port": 8888,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "5c25aa6b-9a78-47b6-9dd0-394855a99b3a",
                        "alterId": 64
                    }
                ],
                "disableInsecureEncryption": true
            },
            "streamSettings": {
                "network": "ws"
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        },
        {
            "protocol": "blackhole",
            "tag": "blocked"
        },
        {
            "protocol": "socks",
            "tag": "sockstor",
            "settings": {
                "servers": [
                    {
                        "address": "127.0.0.1",
                        "port": 9050
                    }
                ]
            }
        }
    ]
}
EOF




# Run V2Ray
#/usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.json
nohup tor & \
    /usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.json
    
echo  "finish sh cmd"
