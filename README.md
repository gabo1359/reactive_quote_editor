<a name="readme-top"></a>

# REACTIVE QUOTE EDITOR

<br />

All-in-one solution for managing quotes with ease. This user-friendly web app allows you to effortlessly create, update, and organize quotes, along with their detailed line items and dates. Streamline your workflow, reduce errors, and keep all your quoting data neatly organized in one place.


<b>Table of Contents:</b>

<ol>
  <li><a href="#features">Features</a></li>
  <li><a href="#demo">Demo</a></li>
  <li>
    <a href="#getting-started">Getting Started</a>
    <ul>
      <li><a href="#option-1">Option 1: Using Docker</a></li>
      <li><a href="#option-2">Option 2: Local Installation</a></li>
    </ul>
  </li>
  <li><a href="#running-tests">Running Tests</a></li>
</ol>

## Features <a name="features"></a>

* *Easily create and manage quotes:* Add new quotes in just a few clicks, update existing ones, or delete outdated quotes with ease. Keep all your quoting data organized and up-to-date without the hassle.
* *Organize with precision:* Break down your quotes into line item dates, and within each date, manage multiple line items. Each line item can include essential details like name, description, unit price, and quantity, ensuring every part of your quote is clear and well-organized.
* *Save time and reduce errors:* The app’s user-friendly design and smart validation features help you enter and manage data accurately, reducing the risk of mistakes and saving you valuable time.

## Demo <a name="demo"></a>

See it alive at: <a href="https://reactive-quote-editor.onrender.com/">Demo Live</a>

```sh
email: manager@kpmg.com
password: password
```

<b>Disclaimer:</b> This application is hosted using <a href="https://render.com/">Render</A>'s free plan. As a result, you may experience occasional delays or interruptions in service. Additionally, database instances may not always be persisted, which could lead to the loss of data between sessions. For the best experience, please be aware of these limitations while using the app.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started <a name="getting-started"></a>

You can set up and run this application using Docker and Docker Compose or by installing the necessary dependencies on your local machine. Choose the setup that best suits your environment.

### Option 1: Using Docker <a name="option-1"></a>

This method requires Docker and Docker Compose to be installed on your system.

1. Clone the repository:

```sh
git clone https://github.com/gabo1359/reactive_quote_editor
cd reactive_quote_editor
```

2. Build and run the application with Docker Compose:
 
```sh
docker compose up --build
```

This command builds the Docker image if it's not already built and starts the containers defined in your `docker-compose.yml` file.

3. Initial setup

Before you can use the application, you'll need to set up and prepare the database. This can be done by accessing the bash shell of your web application container:

```sh
docker compose exec web bash
```

Once inside the container, run:

```sh
bin/setup
```

This command is a way to set up or update your development environment automatically, checking for dependencies and preparing the database.

Your app should now be fully set up and accessible at `http://localhost:3000`.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Option 2: Local Installation  <a name="option-2"></a>

This method requires Ruby, Rails, and SQLite to be installed on your local machine.

Prerequisites:
* Ruby 3.2.3
* Rails 7.1.3
* PostgreSQL
* Redis

1. Clone the repository:

```sh
git clone https://github.com/gabo1359/reactive_quote_editor
cd reactive_quote_editor
```

2. Install dependencies:

```sh
bundle install
```

3. Setup the database:

```sh
rails db:prepare
```

4. Run the application:

```sh
bin/dev
```

Visit `http://localhost:3000` in your browser to view the app.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Running Tests <a name="running-tests"></a>

To run tests, navigate to the root of your project directory and execute:

```sh
rails test:all
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>
