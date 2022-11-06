Assignment
Welcome to the assignment section for DevOps. We understand that time and resources are limited. Hence the assignments are broken into few levels.

Context
The sample application is a simple Spring Boot application that helps in storing the detail of the employees. It exposes REST API to CRUD on employee entity. The data is stored in an in memory database (which means that data stored in the database will not survive a server/app restart).

Prerequisites
Java 8
Maven 3
Git Client (to check out code)
Postman (to invoke the API of the application)
Once checked out, use following commands to build and run the application on local machine.

 cd my-app
 mvn clean install
 cd target
 java -jar my-app-0.0.1-SNAPSHOT.jar
There is a postman collection. Feel free to use and extend the same to test the API behaviour.

Level - 1 : Dockerize the application
Create a Dockerfile for the application
Build the image
Run the image
Level - 2 : Build a CD pipeline
Create a CD pipeline in Jenkins CI server (or any other CI server of your choice)
As part of the pipeline,
Check out the code
Build it
Check using SonarQube (optional)
Test the API
Create Docker image of the same
Push to Docker Hub
Notify once the build is completed
Level - 3 : Provision an environment
Either manually or through code (like through usage of Terraform) provision the environment
As part of the environment,
Create a VPC
Ensure that the VPC spans at least 2 availability zones
Create a public subnet
Create a private subnet
Provision EC2 instances; refer to app-install.sh; use it as user data to initialize an app on VM startup
Configure classic Elastic Load Balancer to route traffic to the EC2 instances
Level - 4 : Deploy the solution
Complete Level - 3
Update the VMs to have Docker runtime
Deploy the image on the VM by downloading it from Docker Hub
