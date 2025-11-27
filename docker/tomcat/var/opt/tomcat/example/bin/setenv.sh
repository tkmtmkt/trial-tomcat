# server.xml用の設定
export HTTP_PORT=8080
export HTTPS_PORT=8443
export SHUTDOWN_PORT=8005
export CONTEXT_PATH=/gitbucket
export WAR_FILE=${CATALINA_BASE}/gitbucket.war

# 環境変数設定
export LANG=ja_JP.UTF-8
export UMASK=0007

# JVMオプション
CATALINA_OPTS="-server -Xmx256m -Xms256M -XX:MaxMetaspaceSize=64M -XX:MetaspaceSize=32M -XX:SurvivorRatio=2"
JAVA_VERSION=$(java -version 2>&1|awk '/version/{print $3}'|sed 's/"//g'|cut -d. -f1)
if [ ${JAVA_VERSION} -eq 8 ]; then
  CATALINA_OPTS="${CATALINA_OPTS} -Xloggc:${CATALINA_BASE}/logs/gc_%t.log -XX:+PrintGCDetails -XX:+PrintGCDateStamps"
  CATALINA_OPTS="${CATALINA_OPTS} -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=10M"
else
  CATALINA_OPTS="${CATALINA_OPTS} -Xlog:gc*=info:file=${CATALINA_BASE}/logs/gc_%t.log:time,uptime,level,tags:filecount=10,filesize=10M"
fi
CATALINA_OPTS="${CATALINA_OPTS} -Djava.security.egd=file:/dev/urandom"
CATALINA_OPTS="${CATALINA_OPTS} -Dtomcat.http.port=${HTTP_PORT}"
CATALINA_OPTS="${CATALINA_OPTS} -Dtomcat.https.port=${HTTPS_PORT}"
CATALINA_OPTS="${CATALINA_OPTS} -Dtomcat.shutdown.port=${SHUTDOWN_PORT}"
CATALINA_OPTS="${CATALINA_OPTS} -Dtomcat.context.path=${CONTEXT_PATH}"
CATALINA_OPTS="${CATALINA_OPTS} -Dtomcat.war.file=${WAR_FILE}"
export CATALINA_OPTS
