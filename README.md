# Terraform-GDP-app-with-postgressql
In this project we are trying to create AWS infrastructure using Terraform and deploy your applicaiton which will be connected to RDS-Postgresql in the backend.

### Architechture Diagram 
![Alt text](./files/architecture.png?raw=true "GTD with Postgresql implementation on AWS using Terraform")
### Prerequisites:

* Basic knowledge of AWS & Terraform
* AWS account
* AWS Access & Secret Key

**Create a file for user data**

* Create data.sh file and add the below code to it

  ```
  #!/bin/bash
  yum update -y
  yum install -y httpd.x86_64
  systemctl start httpd.service
  systemctl enable httpd.service
  echo "Hello World from $(hostname -f)" > /var/www/html/index.html
  ```
  
* The above code will install an apache webserver in the EC2 instances

So, now our entire code is ready. We need to run the below steps to create infrastructure.

* terraform init is to initialize the working directory and downloading plugins of the provider
* terraform plan is to create the execution plan for our code
* terraform apply is to create the actual infrastructure. It will ask you to provide the Access Key and Secret Key in order to create the infrastructure. So, instead of hardcoding the Access Key and Secret Key, it is better to apply at the run time.


**Verify the resources**

* Terraform will create below resources

  * VPC
  * Application Load Balancer
  * Public & Private Subnets
  * EC2 instances
  * RDS instance
  * Route Table
  * Internet Gateway
  * Security Groups for Web & RDS instances
  * Route Table

Once the resource creation finishes, get the DNS of a load balancer and paste it into the browser and load balancer will send the request to two instances.


