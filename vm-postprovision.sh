apt-get update && apt install -y openjdk-8-jdk unzip
wget https://67.228.157.106:8443/tools/ibm-ucd-agent.zip --no-check-certificate
unzip ibm-ucd-agent.zip && cd ibm-ucd-agent-install
echo "locked/agent.name="icp-mcs-00"" >> agent.props
echo "locked/agent.jms.remote.host="67.228.157.106"" >> agent.props
echo "locked/agent.jms.remote.port=7918" >> agent.props
echo "locked/agent.mutual_auth=false" >> agent.props
echo "verify.server.identity=false" >> agent.props
echo "server.url="https://67.228.157.106:8443"" >> agent.props
echo "repository.type=CODESTATION" >> agent.props
echo "JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre" >> agent.props
echo "ps -auxw | grep agent | grep -v grep > /dev/null" >> /opt/ibm-ucd/agent/auto.sh
echo " if [ $? != 0 ]" >> /opt/ibm-ucd/agent/auto.sh
echo "    then" >> /opt/ibm-ucd/agent/auto.sh
echo "     /opt/ibm-ucd/agent/bin/agent start" >> /opt/ibm-ucd/agent/auto.sh
echo "fi" >> /opt/ibm-ucd/agent/auto.sh
chmod +x /opt/ibm-ucd/agent/auto.sh
printf "* * * * * /opt/ibm-ucd/agent/auto.sh" >> /etc/crontab
./install-agent-from-file.sh agent.props && /opt/ibm-ucd/agent/bin/agent start