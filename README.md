# INTRODUCTION
devpi is a cache&mirror of pypi.

# USAGE
run
```
docker run -d  -p 127.0.0.1:3141:3141 --name devpi  cupen/devpi
```
then
```
pip install pipenv -i http://127.0.0.1:3141/root/pypi/+simple
```