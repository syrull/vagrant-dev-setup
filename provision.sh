#!/usr/bin/env bash

apt-get update

# ---------------------------------------------------------------------------
# Repositories
apt install software-properties-common -y
add-apt-repository 'ppa:deadsnakes/ppa' -y

# Docker

apt-get install  ca-certificates gnupg lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

# ---------------------------------------------------------------------------
# Docker Setup
# ---------------------------------------------------------------------------
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -q -y
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# ---------------------------------------------------------------------------
# Python Setup
# https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa
# ---------------------------------------------------------------------------
apt install python-dev -q -y
apt-get install python3.8 python3.9 python3.10 -q -y

# ---------------------------------------------------------------------------
# Rust Setup
# ---------------------------------------------------------------------------
curl https://sh.rustup.rs -sSf | sh -s -- -y

# ---------------------------------------------------------------------------
# Git Setup
# ---------------------------------------------------------------------------
snap install gh
cat > /etc/gitconfig-job <<EOF
[user]
        name = Dimtiar Ganev
        email = dganev@vmware.com
EOF
cat > /etc/gitconfig <<EOF
[user]
        name = Dimtiar Ganev
        email = d.ganev@protonmail.ch
[includeIf "gitdir:/code/work/"]
        path = .gitconfig-job
[credential "https://gitlab.com"]
        provider = generic
EOF


# ---------------------------------------------------------------------------
# Tooling
# ---------------------------------------------------------------------------
apt-get install tmux -q -y
cat > /etc/tmux.conf <<EOF
set -g default-terminal "xterm-256color"
set-option -ga terminal-overrides ",xterm-256color:Tc"
EOF
