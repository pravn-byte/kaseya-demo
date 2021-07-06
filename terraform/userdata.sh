#!/bin/bash
apt-get update
apt-get install default-jdk default-jre tree -y
apt-get install jenkins -y
systemctl enable jenkins
systemctl restart jenkins
systemctl status jenkins


