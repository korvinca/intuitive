## Terraform

* Setup AWS credentials on the host
* Then run command below:

```bash
cd terraform_aws
terraform init
terraform plan
terraform apply
#terraform destroy
```

## Docker

Commands to create and push image are below.

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

Image is avaliable to pull as korvinca/intuitive:latest
