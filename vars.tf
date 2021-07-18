variable "aws_zones" {
 type        = list
 description = "List of availability zones to use"
 default     = ["us-west-2a", "us-west-2c"]
}