
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
   ![image](https://user-images.githubusercontent.com/117442064/200156944-50fdbef1-2dee-4487-97d4-b7c1dfa20b4d.png)


    Subnets Info
    ![image](https://user-images.githubusercontent.com/117442064/200156959-2fb39a2d-1b9c-4c2f-be9d-1c78a12f2ffa.png)


    Load balancer created
    ![image](https://user-images.githubusercontent.com/117442064/200156969-f675b1af-5a68-4ec4-bb8f-4a6cae48c997.png)

6. Now created an ec2 machine to host this docker Image.
   -> While launching the EC2 machine passed the startup script as per the requirement 
       startup script - https://github.com/rajeev-gudivada/onemuthoot/blob/feature/onemuthoot/app-install.sh
       
   -> After successful launch of instance make sure attach this instance to load balancer
       ![image](https://user-images.githubusercontent.com/117442064/200157015-b3e4dbbf-9109-4f3f-8fbb-cd7da9e062d9.png)


    -> After launching the instance make sure install the docker inside VM, use below commands after logging into instance
        yum install docker
        systemctl start docker
        
        
    -> Now pull the Image from the DockerHub which was generated in previous steps. (make sure you login to the Dockerhub on VM to pull the image)
       docker pull rajeevnani9876/onemuthoot:latest

    -> Check whether the image is present or not
           docker images 
           ![image](https://user-images.githubusercontent.com/117442064/200157033-fe924dbc-c489-4ca3-a7fc-4d8a5d38dcd4.png)
    
    -> Run the Docker image 
           docker run -dit rajeevnani9876/onemuthoot:latest

    -> Check for running containers
            docker ps -a 

    -> We can access the application in two ways
        1. Using load balancer DNS name
           http://onemuthoot-1014191001.us-east-1.elb.amazonaws.com/
        2. Using ec2 public ip
            http://18.206.191.227/
       
