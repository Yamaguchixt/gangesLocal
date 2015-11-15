# gangesLocal
#for HEW

##propertiesファイルの作り方
###名前
  ganges.properties
###場所
src/util/ganges.properties
に作成する。
###内容
driverName=com.mysql.jdbc.Driver

connection=jdbc:mysql://localhost/ganges?characterEncoding=utf8

user=root

pass=

serverURL=http://localhost:8080/ganges/

※userとpassはmysqlにログインんするときに使うもの。実際は空行はさまない

