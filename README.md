# Infrastructure as Code "Cat Of The Day" App
This app uses Docker, Terraform and Jenkins to display a random cat of the day on the main page. 

## Docker configuration
Performed through a Bash script, it sets up the first web server and install Docker on a system running a Red Hat-based Linux distribution (such as CentOS or Amazon Linux). Here is a breakdown of what each line does:
- Update system packages
- Install Apache HTTP Server
- Start and Enable Apache HTTP Server
- Create a Simple Web Page
- Install Docker
- Add User to Docker Group

## Jenkins configuration
Performed also through a Bash script, it sets up the 2nd web server and installs Docker and Jenkins on a system running a Red Hat-based Linux distribution (such as CentOS or Amazon Linux). Here is a breakdown of what each line does:
- Update System Packages
- Install Apache HTTP Server and start/enable it
- Create a Simple Web Page
- Install Docker
- Add Jenkins Repository and Import Key
- Upgrade System Packages
- Install Java and Jenkins
- Start and Enable Jenkins Service

## Terraform configuration
### Data Sources:

Defines a data source for an existing AWS security group (tiger01).

### Resources:

- Defines two AWS EC2 instances (app_server_1 and app_server_2):
    - Both instances use the same AMI ID and instance type (t2.micro).
    - Both instances are associated with the same security group (tiger01).
    - app_server_1 runs a user data script (scripts-jenkins.sh) to set up Jenkins.
    - app_server_2 runs a user data script (scripts-docker.sh) to set up Docker.

### Outputs:

- Outputs the security group information (tiger01).
- Outputs the instance ID and public IP address for both instances.
