FROM debian:13.2-slim

# OSパッケージインストール
RUN --mount=type=cache,target=/var/lib/apt/lists <<'EOF'
set -o errexit
apt-get update
apt-get install -y \
        wget
apt-get clean
EOF

# 実行ユーザ追加
RUN <<'EOF'
set -o errexit
useradd -u 1000 -m tomcat
echo tomcat | passwd --stdin tomcat
EOF

# 環境変数
ENV JAVA_HOME=/opt/java/current \
    CATALINA_HOME=/opt/tomcat/current \
    CATALINA_BASE=/var/opt/tomcat/example

# java
ARG BASE_URL=https://download.eclipse.org/temurin-compliance/temurin/8/jdk8u472-b08
ARG TAR=OpenJDK8U-jdk_x64_linux_hotspot_8u472b08.tar.gz
ARG SHASUM=${TAR}.sha256.txt
RUN <<'EOF'
set -o errexit
mkdir -p /opt/java
cd /opt/java
wget -O ${SHASUM} ${BASE_URL}/${SHASUM}
wget -O ${TAR} ${BASE_URL}/${TAR}
sha256sum -c ${SHASUM}
cd /opt/java
tar xf ${TAR}
ln -s jdk8u472-b08 ${JAVA_HOME}
chown -R root:root /opt/java
chmod -R go-w /opt/java
rm -rf ${SHASUM} ${TAR} ${JAVA_HOME}/src.zip
EOF

# tomcat
ARG BASE_URL=https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.112/bin
#ARG BASE_URL=https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.49/bin
#ARG BASE_URL=https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.14/bin
ARG TAR=apache-tomcat-9.0.112.tar.gz
ARG SHASUM=${TAR}.sha512
RUN <<'EOF'
set -o errexit
mkdir -p /opt/tomcat
cd /opt/tomcat
wget -O ${SHASUM} ${BASE_URL}/${SHASUM}
wget -O ${TAR} ${BASE_URL}/${TAR}
sha512sum -c ${SHASUM}
tar xf ${TAR}
ln -s ${TAR%.tar.gz} ${CATALINA_HOME}
find /opt/tomcat -type d -exec chmod a+rx {} +
find /opt/tomcat -type f -exec chmod a+r {} +
find /opt/tomcat -name '*.sh' -exec chmod a+x {} +
rm -rf ${SHASUM} ${TAR}
# tomcatインスタンス作成
${CATALINA_HOME}/bin/makebase.sh ${CATALINA_BASE}
chown -R tomcat:tomcat ${CATALINA_BASE}
EOF

USER tomcat
COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
