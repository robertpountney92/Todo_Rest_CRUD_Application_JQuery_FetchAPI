# Todo_App

  
  
  

## Pre requisites:

* Must have a Jenkins server to perform pipeline run (can use **jenkinsci/blueocean** docker image)
* Configure GitHub web hooks with Jenkins
* AWS access and secret key to be set up as global credentials within Jenkins instance
* SSH Keys to connect Jenkins instance with GitHub
* SSH Keys to connect Jenkins instance to the instance we are creating (using terraform)
* S3 bucket/DynamoDB already set up to store terraform remote state

  

## Still to do

* Mongo db on separate instance, in its own private subnet not accessible to internet
* Use DynamoDB instead of Mongo installed on EC2