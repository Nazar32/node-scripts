#!/bin/bash

DD_AGENT_MAJOR_VERSION=7 DD_SITE="datadoghq.eu" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"

sudo apt update
sudo apt install rpl -y

rpl '# logs_enabled: false' 'logs_enabled: true' /etc/datadog-agent/datadog.yaml

sudo usermod -a -G systemd-journal dd-agent

sudo tee <<EOF >/dev/null /etc/datadog-agent/conf.d/journald.d/conf.yaml
logs:
  - type: journald
EOF

sudo systemctl restart datadog-agent
