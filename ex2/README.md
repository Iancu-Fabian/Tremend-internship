Installed git:

	- apt install git
Cloned the repo:

	- git clone https://github.com/anddragn/Internship-Resources-2025.git
Created dockerfile

Tried to run

	- docker build -t calculator-app .
  	- docker run -p 8080:8080 calculator-app 
 to map 8080 on my machine to 8080 on the container

Got an error because Flask wasn't in requirements.txt
Added Flask, tried again, running the container succeded

Tried to test the app by accessing localhost:8080 in the browser, got an error

Checked calculator.py to see the port Flask was running on, it was 5000 instead of 8080

Fixed that, then I could access the app in the browser

Created new DockerHub repo to test pushing the image

Logged in with docker login, tagged and pushed the image to the repo

Created .github/workflows directory within my working folder, then created the deploy_app.yaml script, where I used GitHub repo secrets for the Docker username and password

Tested the pipeline with a push and it succeded
