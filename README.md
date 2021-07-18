# tf-eks-sample

# Settings required only for the first time
Create S3 backet.  
backet name is `eks-sample-terraform`.  


# Deployment

Export environment  
```
$ export AWS_ACCESS_KEY_ID=ABC123
$ export AWS_SECRET_ACCESS_KEY=DEF123
```

```
$ rm -rf .terraform
$ docker run -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} -it -v $PWD:/app/ -w /app/ --rm hashicorp/terraform:1.0.2 init
$ docker run -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} -it -v $PWD:/app/ -w /app/ --rm hashicorp/terraform:1.0.2 plan
$ docker run -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} -it -v $PWD:/app/ -w /app/ --rm hashicorp/terraform:1.0.2 apply
```