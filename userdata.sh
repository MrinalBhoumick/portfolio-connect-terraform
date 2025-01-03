#!/bin/bash

# Update and install necessary packages
sudo yum update -y
sudo yum install -y httpd

# Enable and start the Apache server
sudo chkconfig httpd on
sudo service httpd start

# Install and configure Amazon SSM Agent
sudo yum install -y https://s3.amazonaws.com/amazon-ssm-us-east-1/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent

# Move the photo to the appropriate location
sudo cp "/mnt/data/Mrinal-Photo.jpg" /var/www/html/Mrinal-Photo.jpg

# Deploy portfolio content
echo "<!DOCTYPE html>
<html lang="en">
<head>
    <title>Mrinal Bhoumick - Portfolio</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        header {
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #4CAF50;
            color: white;
            padding: 20px 10px;
        }
        header img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            margin-right: 20px;
            border: 3px solid white;
        }
        header h1 {
            margin: 0;
            font-size: 2rem;
        }
        header p {
            margin: 0;
            font-size: 1.2rem;
        }
        main {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            max-width: 300px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
        }
        .about { background-color: #FFDDC1; }
        .education { background-color: #FFABAB; }
        .experience { background-color: #FFC3A0; }
        .projects { background-color: #D5AAFF; }
        .connect { background-color: #85E3FF; }
        .card h2 {
            margin: 0;
            padding: 10px 0;
            color: white;
        }
        .card p, .card a {
            margin: 10px;
            padding: 0 10px;
            color: #333;
            text-align: left;
        }
        .card a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }
        .card a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <img src='Mrinal-Photo.jpg' alt='Mrinal Bhoumick'>
        <div>
            <h1>MRINAL BHOUMICK</h1>
            <p>(He/Him)</p>
        </div>
    </header>
    <main>
        <div class='card about'>
            <h2>About Me</h2>
            <p>Associate DevOps Engineer @ Workmates Core2Cloud Solution Pvt Ltd</p>
            <p>AWS Certified Developer - Associate | ACM-ICPC Regionalist '23</p>
            <p>Aspiring Cloud DevOps Engineer</p>
        </div>
        <div class='card education'>
            <h2>Education</h2>
            <p>Techno India University (2020 - 2024)</p>
            <p>Bachelor of Technology in Computer Science and Business Systems</p>
            <p>CGPA: 8.61</p>
        </div>
        <div class='card experience'>
            <h2>Experience</h2>
            <p>Associate DevOps Engineer @ Workmates Core2Cloud Pvt Ltd</p>
            <p>Web Development Intern @ Oasis Infobyte</p>
        </div>
        <div class='card projects'>
            <h2>Projects</h2>
            <p><a href='https://moviloco.vercel.app/' target='_blank'>Movix</a> - A movie recommendation system</p>
            <p><a href='https://authenticated-password-vault-aws.vercel.app/signup' target='_blank'>Vaultify</a> - A secure password vault</p>
        </div>
        <div class='card connect'>
            <h2>Connect With Me</h2>
            <p><a href='https://github.com/MrinalBhoumick' target='_blank'>GitHub: Mrinal Bhoumick</a></p>
            <p><a href='https://www.linkedin.com/in/mrinal-bhoumick-17272a1a1/' target='_blank'>LinkedIn: Mrinal Bhoumick</a></p>
        </div>
    </main>
</body>
</html>" | sudo tee /var/www/html/index.html
