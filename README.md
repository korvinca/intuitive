## Docker

No changes in main Docker file. All works by default.
Commands to create and push image are below.
Image avaliable to pull from korvinca/intuitive:latest

```bash
 cd intuitive
 git add .
 git commit -m "init main"
 git push
 git checkout -b feature
 cd docker
 docker build -t korvinca/intuitive:latest .
 docker images
 docker run -d -it korvinca/intuitive:latest bash
 docker ps
 docker image tag korvinca/intuitive:latest
 docker login --username=korvinca
 docker image push korvinca/intuitive:latest
```

