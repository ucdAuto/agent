#!/bin/bash
#jfos-8-18
 
 
mkdir agent && cd agent
echo "
apt-get update && apt install -y openjdk-8-jdk unzip; wget https://67.228.157.106:8443/tools/ibm-ucd-agent.zip --no-check-certificate; \
unzip ibm-ucd-agent.zip && cd ibm-ucd-agent-install; echo "locked/agent.name="icp-mcs-00"" >> agent.props; \
echo "locked/agent.jms.remote.host="67.228.157.106"" >> agent.props; \
echo "locked/agent.jms.remote.port=7918" >> agent.props; echo "locked/agent.mutual_auth=false" >> agent.props; \
echo "verify.server.identity=false" >> agent.props; echo "server.url="https://67.228.157.106:8443"" >> agent.props; \
echo "repository.type=CODESTATION" >> agent.props; echo "JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre" >> agent.props; \
./install-agent-from-file.sh agent.props; "/opt/ibm-ucd/agent/bin/agent start &"" > vm-postprovision.sh
chmod +x vm-postprovision.sh
git init
git add .
git commit -m "agent install file"
git remote add origin git@github.com:ucdAuto/agent.git
git pull -q origin master
git push -u origin master
