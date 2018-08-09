#!/bin/bash
#jfos 8-8-18

apt-get update && apt install -y openjdk-8-jdk; wget https://67.228.157.106:8443/tools/ibm-ucd-agent.zip --no-check-certificate; \
                 unzip ibm-ucd-agent.zip && cd ibm-ucd-agent-install; echo "locked/agent.name="icp-001-agent" > agent.props; \
                 echo "locked/agent.jms.remote.host="67.228.157.106"" >> agent.props; echo "locked/agent.jms.remote.host="67.228.157.106"" >> agent.props; \
                 echo "locked/agent.jms.remote.port=7918" >> agent.props; echo "locked/agent.mutual_auth=false" >> agent.props; \
                 echo "verify.server.identity=false" >> agent.props; server.url="https://67.228.157.106:8443" >> agent.props; \
                 echo "repository.type=CODESTATION" >> agent.props; echo "JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre" >> agent.props; \
                 install-agent-from-file.sh agent.props;
