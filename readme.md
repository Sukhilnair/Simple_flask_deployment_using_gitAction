# Simple Flask Deployment Using GitHub Actions
This repository contains a simple Flask application that is automatically deployed to an AWS EC2 instance using GitHub Actions.

## Table of Contents
1. Project Overview
2. Setup Guide
- Prerequisites
- AWS EC2 Setup
- GitHub Secrets Configuration
- SSH Private Key Setup
3. CI/CD Pipeline
4. Folder Structure
5. Running the Application

## Project Overview
This project demonstrates an automated CI/CD pipeline for a Flask application. The pipeline will:

1. Clone the repository.
2. Set up a Python virtual environment and install dependencies.
3. Run tests using pytest.
4. Deploy the application to an AWS EC2 instance using SSH and SCP.
5. Start the application on the EC2 instance.
## Setup Guide
Prerequisites
Ensure you have the following ready:

- AWS account with an EC2 instance running.
- An SSH key pair that allows you to connect to your EC2 instance.
- GitHub repository for your project.
- Python 3.x installed on your EC2 instance.
## AWS EC2 Setup
1. Launch an EC2 instance:

- Use an Ubuntu AMI.
- Assign the appropriate security group that allows SSH (port 22) and HTTP (port 80) access.
- Ensure your EC2 instance has a public IP and is accessible over the internet.

2. Create deployment directory: SSH into your EC2 instance and create a directory for the application:
```bash
ssh -i your_key.pem ubuntu@your_ec2_ip
mkdir -p /home/ubuntu/flask-app
```
3. Install necessary software on the EC2 instance:

- Python 3 and pip:
```bash
sudo apt update
sudo apt install python3-pip python3-venv -y
```
4. Configure Flask app on EC2: Make sure your EC2 instance is ready to run a Flask app by configuring it to use gunicorn or another WSGI server for production, as needed.

## GitHub Secrets Configuration
To securely connect GitHub Actions to your EC2 instance, you’ll need to add a few secrets to your GitHub repository. Follow these steps:

1. Go to your repository on GitHub.
2. Navigate to Settings > Secrets and variables > Actions > New repository secret.
3. Add the following secrets:
- EC2_SSH_KEY: Your private SSH key.


## CI/CD Pipeline
The GitHub Actions workflow is defined in the .github/workflows/simpleflask.yml file. It automates the process of testing, building, and deploying the Flask app to the EC2 instance.

### Key Steps in the Workflow:
1. Clone the repository: Checks out the repository code.
2. Set up Python: Installs Python and dependencies via requirements.txt.
3. Run tests: Executes unit tests using pytest.
4. Deploy to EC2: Transfers the application files to the EC2 instance using scp and runs the deployment script (run.sh).

## Folder Structure
```bash
Simple_flask_deployment_using_jenkins/
│
├── .github/
│   └── workflows/
│       └── simpleflask.yml             # GitHub Actions workflow file
│
├── app_test.py                         # Test file for your application
├── requirements.txt                    # Python dependencies
├── run.sh                              # Deployment script to run on EC2
├── app.py
└── README.md                           # Project documentation
```
### Running the Application
After a successful push to the main branch, the GitHub Actions workflow will automatically:

1. Run the test cases.
2. Deploy the Flask app to your EC2 instance.
3. Run the run.sh script to start the application on the server.

![Final output](relative/path/to/image.png)
