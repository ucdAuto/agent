apt-get update && apt install -y openjdk-8-jdk unzip
wget https://67.228.157.106:8443/tools/ibm-ucd-agent.zip --no-check-certificate
unzip ibm-ucd-agent.zip && cd ibm-ucd-agent-install
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre >> agent.props
echo "ps -auxw | grep agent | grep -v grep > /dev/null" >> auto.sh
echo " if [ $? != 0 ]" >> auto.sh
echo "    then" >> auto.sh
echo "     /opt/ibm-ucd/agent/bin/agent start" >> auto.sh
echo "fi" >> auto.sh
chmod +x auto.sh
printf "* * * * * /opt/ibm-ucd/agent/auto.sh" >> /etc/crontab
./install-agent-from-file.sh agent.props && /opt/ibm-ucd/agent/bin/agent start
