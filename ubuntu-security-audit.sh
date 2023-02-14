#!/bin/bash

# Update the package list
sudo apt update

# Upgrade installed packages
sudo apt upgrade -y

# Check for security vulnerabilities
sudo apt install apt-show-versions -y
sudo apt-show-versions | grep -v uptodate

# Check for open ports
sudo apt install nmap -y
nmap localhost

# Check for rootkit infections
sudo apt install rkhunter -y
sudo rkhunter --check

# Check for firewall configuration
sudo apt install ufw -y
sudo ufw status

# Check for SSH configuration
grep -i PermitRootLogin /etc/ssh/sshd_config
grep -i PasswordAuthentication /etc/ssh/sshd_config

# Check for Sudoers file permissions
sudo ls -l /etc/sudoers

# Check for cron jobs
sudo ls -l /etc/cron.*

# Check for file permissions
sudo find / -type f \( -perm -o+w -o -perm -g+w \) -exec ls -ld {} \;

# Check for password strength
sudo apt install cracklib-runtime -y
cracklib-check /etc/passwd
cracklib-check /etc/shadow

# Check for outdated software
sudo apt install debsecan -y
sudo debsecan

# Provide possible solutions for detected issues
echo "Some possible solutions for the detected issues are:"
echo "- Update all packages regularly"
echo "- Configure a firewall to restrict incoming traffic"
echo "- Implement SSH key authentication and disable password authentication"
echo "- Limit the use of the root account"
echo "- Check and fix file permissions"
echo "- Use strong passwords and implement a password policy"
echo "- Remove or replace outdated software"

# Clean up
sudo apt-get clean
