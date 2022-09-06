# OPC_Project13

## Welcome

The goal of this project was to take an older code base and apply a fresh coat of paint:
- Code base has been refactored for better lisibility and maintenance
- Added to a CI/CD pipeline using CircleCi & Heroku
- Added a Sentry has a additional layer to error detection

# Requirements

* Python3 at https://www.python.org/downloads
* ... and that's it !

# Installation

## Step 1: Acquire the codebase

### Using Git Desktop
With the desktop app, simply click on the "Code" (green button) at the top of this page and then "Open with GitHub Desktop".

Clone the file to desired location and you're done !

### Using Git Console
Navigate to desired location and use:
```
git clone https://github.com/Dhyakia/OPC_Project10.git
```

### Using the manual download
Click on the "Code" (green button) at the top of this page and then "Download Zip"

Un-zip the file into the desired location and you're done !

## Step 2: Setting up a virtual environement

For a better user experience, it is recommanded to use a virtual environnement.

1. With the console, navigate to the folder of installation.

2. Next, to create the environnement, enter this command:
    
    Windows: ```python -m venv venv ```

    MacOs/Linux: ```python -m venv venv ```

3. Now, all that's left if to activate it:

    Windows: ```venv/scripts/activate```

    MacOs/Linux: ```venv/bin/activate```

If everything is done correctly, you should now see the "venv" tag at the start of the line of the console.

## 3. Install the dependencies

Using the console, navigate to the project folder and enter:
```
pip install -r requirements.txt
```

## 4. First launch: setting up the database

Using the console, navigate inside the code depot folder, where the manage.py file is and enter:
```
python manage.py migrate
```

Congratulation, you're now all setup for using the application !

# Usage

## Starting the server
Activate the virtual environnement.


Using the console, navigate inside the code folder, and enter:

```
python manage.py runserver
```

# Deployement

Before anything, i take for account that, by following the previous chapter (Installation), you can fetch the code and make it run on your machine. That will be the point we start from.

## High level recap

This part will convey the requirements needed to deploy the code within the CI/CD pipeline, using CircleCI and Heroku. 
Because the majority of the work is automated by the config file found in "circleci/config.yml", you won't have any command to type in the console !

At the end of this guide, you'll be able to get the code checked in CircleCI (testing), than if the code is passing the tests, it will create a docker container, that will be pushed to dockerhub, and finally the code will deploy on heroku.

## Requirements

This time, you won't need any module/apps to dowload.

All you will need to do, is to create account for those following website:
- Docker 
- Heroku
- CircleCI


## Step-by-step guide to deployement

Now that you have an account in each site i'll go over what to do for each of them

### `Docker`

Docker will be the shorter one. Here, all you need to do a create a repository. It will host the container. Just remember the name of the dockerhub depot and his repository.

### `Heroku`

Here we will create an application (remember the name!) and 


To do so, once the app in created, click on it and `SETTINGS`.

From there, search for the `CONFIG VAR` and click on the `REVEAL CONFIG VAR`.

Finaly, you can setup the 2 variables we need here:

```
SECRET_KEY -> fp$9^593hsriajg$_%=5trot9g!1qa@ew(o-1#@=&4%=hp46(s
SENTRY_KEY -> https://1bcd57480ed3429eb89febfae90f228b@o1382894.ingest.sentry.io/6698677
```

`WARNING:` FOR SIMPLICITY SAKE, THESE ARE THE REAL KEYS. IN A REAL-LIFE SCENARIO, NEVER EVER REVEAL KEYS TO PUBLIC !!!

### `CircleCI`

First task here is to connect to the code. Because the code is hosted on my Github, i select it and voilà !

The second task will be to select the right project to follow, in our case it's name `Project13`.

For the third step, you'll need to set up a buch on environement variables. 
To do so, go to: 
```
PROJECTS -> "..." -> PROJECT SETTINGS -> ENVIRONMENT VARIABLES
```

From there, you can enter the environemnt variables as so:
```
HEROKU_API_KEY          -> Can be found in Heroku -> Profile settings -> API Key section

HEROKU_APP_NAME	        -> Name of the app created in Heroku

SECRET_KEY	            -> Same as above

SENTRY_DSN	            -> Same as above

dockerhub_username	    -> Your dockerhub username

dockerhub_password	    -> Your dockerhub password

dockerhub_depot	        -> Name of your dockerhub depot name

dockerhub_repository	-> Your dockerhub repository name
```

### `Deployement`

At this point, everything is set for deployement. Any push into the master will start the CircleCI process as explained above: testing -> docker container + publish -> heroku deployement.


# Futur viewing

This is the thirteenth out of thirteen python project with OpenClassRoom

It conclude my formation as a junior python developper !