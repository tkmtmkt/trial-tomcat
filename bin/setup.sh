#!/usr/bin/env bash
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
BASE_DIR=$(cd ${SCRIPT_DIR}/..;pwd)

set -o errexit
set -o errtrace
set -o nounset
set -o pipefail
#set -o verbose

CATALINA_HOME=/opt/apache-tomcat
CATALINA_BASE=/var/opt/apache-tomcat/example
MAJOR_VERSION=9
MINOR_VERSION=0.111
VERSION=${MAJOR_VERSION}.${MINOR_VERSION}
TOMCAT_HOME=${BASE_DIR}/tomcat${CATALINA_HOME}
TOMCAT_BASE=${BASE_DIR}/tomcat${CATALINA_BASE}
TOMCAT_DIR=${TOMCAT_HOME}-${VERSION}
TOMCAT_ARCHIVE=${TOMCAT_DIR}.tar.gz
TOMCAT_URL=https://dlcdn.apache.org/tomcat/tomcat-${MAJOR_VERSION}/v${VERSION}/bin/${TOMCAT_ARCHIVE##*/}

# tomcatインストール先のディレクトリ作成
if [ ! -e ${TOMCAT_DIR} ]; then
  mkdir -p ${TOMCAT_DIR}
fi

# tomcatアーカイブをダウンロードする
if [ ! -e ${TOMCAT_ARCHIVE} ]; then
  wget -O ${TOMCAT_ARCHIVE} ${TOMCAT_URL}
fi

# tomcatアーカイブを展開する
if [ -e ${TOMCAT_DIR} ]; then
  rm -rf ${TOMCAT_DIR}
fi
tar xf ${TOMCAT_ARCHIVE} -C ${TOMCAT_DIR%/*}

# tomcatのシンボリックリンクを作成する
if [ -e ${TOMCAT_HOME} ]; then
  rm ${TOMCAT_HOME}
fi
ln -s ${TOMCAT_DIR##*/} ${TOMCAT_HOME}

# tomcatのインスタンスを作成する
if [ -e ${TOMCAT_BASE} ]; then
  rm -rf ${TOMCAT_BASE}
fi
docker compose run --rm tomcat ${CATALINA_HOME}/bin/makebase.sh ${CATALINA_BASE}
