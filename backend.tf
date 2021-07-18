terraform {
 backend "s3" {
   bucket         = "eks-sample-terraform"
   key            = "terraform.tfstate"
   region         = "us-west-2"
   encrypt        = true
 }
}