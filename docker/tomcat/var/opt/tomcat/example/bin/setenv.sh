export LANG=ja_JP.UTF-8
export UMASK=0007
JAVA_VERSION=$(java -version 2>&1|awk '/version/{print $3}'|sed 's/"//g'|cut -d. -f1)

CATALINA_OPTS="-server -Xmx256m -Xms256m -XX:MaxMetaspaceSize=256m -XX:MetaspaceSize=256m -XX:SurvivorRatio=2"
if [ ${JAVA_VERSION} -ge 9 ]; then
  CATALINA_OPTS="${CATALINA_OPTS} -Xlog:gc*=info:file="${CATALINA_BASE}/gc_%t.log":time,uptime,level,tags:filecount=10,filesize=10M"
else
  DATE=`date +'%Y%m%d-%H%M%S'`
  CATALINA_OPTS="${CATALINA_OPTS} -Xloggc:${CATALINA_BASE}/logs/gc.log.${DATE} -XX:+PrintGCDetails -XX:+PrintGCDateStamps"
fi
CATALINA_OPTS="${CATALINA_OPTS} -Djava.security.egd=file:/dev/urandom"
export CATALINA_OPTS
