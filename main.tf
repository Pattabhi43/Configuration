
terraform { #This indicates the terraform declaration#
  required_providers {
    aws = {
      source  = "hashicorp/aws" #From where the provider is getting downloaded#
      version = "= 3.74.2"      #Version of AWS which is used#
    }
  }

  /*  backend "s3" {                                                            #Name of the dynamo DB table#
    profile = aws_iam_user.user3.name
    bucket = "user-03-bucket"

  }
*/
}
# Configure the AWS Provider
provider "aws" { #Provider Block initiated#
  region     = "ap-south-1"
  access_key = "AKIAZJMM3CBGS2PKFFGD"
  secret_key = "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"
  #  access_key = "AKIAZJMM3CBGS2PKFFGD"                           #Unique access key given to the user#
  #  secret_key = "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"       #Unique secret key given to the user#
}
