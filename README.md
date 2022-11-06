
### Assignment

### GiHub URL for the application - https://github.com/rajeev-gudivada/onemuthoot/tree/feature/onemuthoot

### Generated Docker Image from for the application - https://hub.docker.com/repository/docker/rajeevnani9876/onemuthoot

### Application URL - http://onemuthoot-1014191001.us-east-1.elb.amazonaws.com/  or http://18.206.191.227/

1. Docker file generated for the application.
Path for Dockerfile - https://github.com/rajeev-gudivada/onemuthoot/blob/feature/onemuthoot/my-app/Dockerfile

2. To build the Docker image for the application use the below command 
   docker build -t rajeevnani9876/onemuthoot .  (tag can be varied)

3. To run the image use below command
    docker run -dit rajeevnani9876/onemuthoot:latest

    To view the running containers use docker ps -a

    ![image](https://user-images.githubusercontent.com/117442064/200156902-814fd359-2077-4d85-95cc-ad43e98f5bf6.png)


4. To Automate the process of building this docker image and pushing it to DockerHub I wrote a Jenkinsfile which will help us to generate docker image from Dockerfile and pushing it to DockerHub and notifying the build status over email.

    Path for Jenkinsfile - https://github.com/rajeev-gudivada/onemuthoot/blob/feature/onemuthoot/Jenkinsfile

5. To provision this I set up an Infra with required VPC, subnets and load balancer
   
   VPC info
   image.png

    Subnets Info
    image.png

    Load balancer created
    image.png

6. Now created an ec2 machine to host this docker Image.
   -> While launching the EC2 machine passed the startup script as per the requirement 
       startup script - https://github.com/rajeev-gudivada/onemuthoot/blob/feature/onemuthoot/app-install.sh

    -> After launching the instance make sure install the docker inside VM, use below commands after logging into instance
        yum install docker
        systemctl start docker

    -> Now pull the Image from the DockerHub which was generated in previous steps. (make sure you login to the Dockerhub on VM to pull the image)
       docker pull rajeevnani9876/onemuthoot:latest

    -> Check whether the image is present or not
           docker images 
           image.png
    
    -> Run the Docker image 
           docker run -dit rajeevnani9876/onemuthoot:latest

    -> Check for running containers
            docker ps -a 

    -> We can access the application in two ways
        1. Using load balancer DNS name
           http://onemuthoot-1014191001.us-east-1.elb.amazonaws.com/
        2. Using ec2 public ip
            http://18.206.191.227/
       
