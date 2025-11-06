# trial-tomcat

### 操作

```sh
# 初期設定（tomcatをダウンロードしてインスタンス作成まで行う）
bin/setup.sh

# tomcatインスタンスを起動する
bin/up.sh
```

chromebook のターミナルで実行した場合、以下のURLでアクセスする。
- http://penguin.termina.linux.test:8080/

WSLで実行した場合、以下のURLでアクセスする。
- http://localhost:8080/


### 補足

```
$ tree -F --dirsfirst --charset=ascii trial-tomcat -L 4 -I "*.gz"
trial-tomcat/
|-- bin/
|   |-- down.sh*
|   |-- exec.sh*
|   |-- logs.sh*
|   |-- ps.sh*
|   |-- setup.sh*
|   `-- up.sh*
|-- tomcat/
|   |-- opt/
|   |   |-- apache-tomcat -> apache-tomcat-9.0.111/
|   |   `-- apache-tomcat-9.0.111/
|   `-- var/
|       `-- opt/
|           `-- apache-tomcat/
|               `-- example/
|-- README.md
`-- docker-compose.yml
```
