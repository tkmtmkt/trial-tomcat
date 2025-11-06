export LANG=ja_JP.UTF-8
export UMASK=0007

DATE=`date +'%Y%m%d-%H%M%S'`
CATALINA_OPTS="-server -Xmx256m -Xms256m -XX:MaxMetaspaceSize=256m -XX:MetaspaceSize=256m -XX:SurvivorRatio=2"
CATALINA_OPTS="${CATALINA_OPTS} -Xloggc:${CATALINA_BASE}/logs/gc.log.${DATE} -XX:+PrintGCDetails -XX:+PrintGCDateStamps"
CATALINA_OPTS="${CATALINA_OPTS} -Djava.security.egd=file:/dev/urandom"
export CATALINA_OPTS
