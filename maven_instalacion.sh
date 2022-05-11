#!/bin/bash
sudo apt update -y && sudo apt upgrade -y

#Install OpenJDK - Maven 3.3+ requires JDK 1.7 or above to be installed.
sudo apt install default-jdk git -y

#Download latest Apache Maven version (05/05/2022 today is 3.8.4). Before continuing with the next step, visit the Maven download page to check latest version
sudo wget -P /tmp https://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz

#Once the download is completed, extract the archive in the /opt directory:
sudo tar -xf /tmp/apache-maven-3.8.5-bin.tar.gz -C /opt

#To have more control over Maven versions and updates, we will create a symbolic link maven that will point to the Maven installation directory:
sudo ln -s /opt/apache-maven-3.8.5 /opt/maven

echo 'export JAVA_HOME=/usr/lib/jvm/default-java' | sudo tee -a /etc/profile.d/maven.sh
echo 'export M2_HOME=/opt/maven' | sudo tee -a /etc/profile.d/maven.sh
echo 'export MAVEN_HOME=/opt/maven' | sudo tee -a /etc/profile.d/maven.sh
echo 'export PATH=/opt/maven/bin:$PATH' | sudo tee -a /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
