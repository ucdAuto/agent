apt-get update && apt install -y openjdk-8-jdk unzip \n wget https://67.228.157.106:8443/tools/ibm-ucd-agent.zip --no-check-certificate \n
unzip ibm-ucd-agent.zip && cd ibm-ucd-agent-install \n echo locked/agent.name=icp-001-agent > agent.props \n
echo locked/agent.jms.remote.host=67.228.157.106 >> agent.props \n
echo locked/agent.jms.remote.port=7918 >> agent.props \n
echo locked/agent.mutual_auth=false >> agent.props \n
echo verify.server.identity=false >> agent.props \n
echo server.url=https://67.228.157.106:8443 >> agent.props; \n
echo repository.type=CODESTATION >> agent.props \n
echo JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre >> agent.props \n
./install-agent-from-file.sh agent.props\n
sleep 1
/opt/ibm-ucd/agent/bin/agent start
