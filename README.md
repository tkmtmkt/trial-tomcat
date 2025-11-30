# trial-tomcat

### 操作

```sh
# tomcatコンテナを起動する
bin/up.sh

# tomcatコンテナのログを確認する
bin/logs.sh

# tomcatコンテナを停止する
bin/down.sh
```

chromebook のターミナルで実行した場合、以下のURLでアクセスする。
- http://penguin.termina.linux.test:8080/

WSLで実行した場合、以下のURLでアクセスする。
- http://localhost:8080/


### 補足

```
$ tree -F --dirsfirst --charset=ascii trial-tomcat -L 7
trial-tomcat/
|-- bin/
|   |-- down.sh*
|   |-- exec.sh*
|   |-- logs.sh*
|   |-- ps.sh*
|   `-- up.sh*
|-- docker/
|   `-- tomcat/
|       |-- var/
|       |   `-- opt/
|       |       `-- tomcat/
|       |           `-- example/
|       |               |-- bin/
|       |               |-- conf/
|       |               |-- lib/
|       |               |-- logs/
|       |               |-- temp/
|       |               |-- webapps/
|       |               |-- work/
|       |               `-- sample.war
|       |-- docker-entrypoint.sh*
|       `-- Dockerfile
|-- README.md
`-- docker-compose.yml
```
