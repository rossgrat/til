# Docker system prune
You can cleanup docker volumes with:
```
$ docker system prune -a --volumes -f 2>&1
```
This freed up 148.5 GB on my system.

