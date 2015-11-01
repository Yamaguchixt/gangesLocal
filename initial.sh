name=$1
remote=$2
if [ -d "src" ]; then
  rm -rf src
fi

if [ -d "WebContent" ]; then
  rm -rf WebContent
fi

git clone $remote

mv ./gangesLocal/src ./src
mv ./gangesLocal/WebContent ./WebContent
mv ./gangesLocal/.gitignore ./.gitignore
mv ./gangesLocal/sql ./sql

rm -rf ./gangesLocal

touch src/util/ganges.properties
echo "driveName=com.mysql.jdbc.Driver" >> src/util/ganges.properties
echo "connection=jdbc:mysql://localhost/ganges?characterEncoding=utf8" >> src/util/ganges.properties
echo "user=root" >> src/util/ganges.properties
echo "pass=" >> src/util/ganges.properties
echo "serverURL=http:localhost:8080/ganges/" >> src/util/ganges.properties

git init
git config --global user.name $name
git config --global user.email "${name}@example.com"
git config --global color.ui auto
git remote add origin $remote
git remote add upstream https://github.com/Yamaguchixt/gangesLocal.git

git add -A
git commit -m "first commit created by script"
git pull origin master
git push origin master







