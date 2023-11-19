# Cash Register Web App

## Project Overview

Hello there! This project showcases React and Ruby on Rails architecture, emphasizing the design of components using SOLID principles under a modularized architecture. The main goal of this app is to let you see how different pieces work together in a simple shopping cart. You can add products and find out the total price easily.

## Before You Start

Before you start, make sure your computer has the following things:

- At least 8GB of memory (RAM)
- [Docker](https://www.docker.com/get-started)
- [Ruby on Rails](https://rubyonrails.org/)
- [RSpec gem](https://rspec.info/) (for running tests)
- [Node.js](https://nodejs.org/) (for the frontend)
- [Cypress](https://www.cypress.io/) (for end-to-end tests)

## How to Begin

1. **Copy the Code:**

    Copy this code and paste it into your computer's command line:

    ```bash
    git clone https://bitbucket.org/david_abba/dabba-rails-tech.git
    ```

    Also you can [see the code from this URL.](https://bitbucket.org/david_abba/dabba-rails-tech/src/master/)

2. **Go to the Project Folder:**

    Now, go to the place where you copied the code:

    ```bash
    cd dabba-rails-tech
    ```

3. **First-Time Setup:**

    If this is your first time running the code, follow these steps to set up the test database:

    For development purposes:
    ```bash
    cd backend
    rails db:create RAILS_ENV=development
    rails db:migrate RAILS_ENV=development
    rails db:seed RAILS_ENV=development
    ```

    For testing purposes:
    ```bash
    cd backend
    rails db:create RAILS_ENV=test
    rails db:migrate RAILS_ENV=test
    rails db:seed RAILS_ENV=test
    ```

4. **Start the App:**

   - If you use Linux, type this and press Enter:

     ```bash
     ./start-app.sh
     ```

   - If you use Windows, type this and press Enter:

     ```bash
     start-app.bat
     ```

   This will do a bunch of things like making containers, setting up the database, and starting the app. When it's done, you can open the app in your web browser at http://localhost:8080.

   Alternatively, you can start the backend and frontend manually:

   - **Start the Backend:**

     Open a terminal and type:

     ```bash
     cd backend
     rails server
     ```

   - **Start the Frontend:**

     Open a second terminal and type:

     ```bash
     cd frontend
     npm start
     ```

   This will start the backend server at http://localhost:3000 and the frontend server at http://localhost:8080.

## Testing

You can also test the app to make sure everything works:

- **For the Frontend:**

    Go to the "frontend" folder and type:

    ```bash
    cd frontend
    npm test
    ```

- **For the Backend:**

    Go to the "backend" folder and type:

    ```bash
    cd backend
    rspec
    ```

- **Run End-to-End Tests with Cypress:**

   Ensure both the backend and frontend systems are running. Then, open a terminal and navigate to the "e2e" folder:

   ```bash
   cd e2e
   npm test
   ```

   Cypress will launch, allowing you to choose the "e2e testing" suite, select your preferred browser, and click "start e2e testing...". Click on any of the tests, and they will execute.

Feel free to play around with the code and make it your own. 

## Next Steps

There are some tasks yet to be completed, including:

- In order to enhance code quality and maintainability, the task involves implementing method signatures using Sorbet for optional static typing in Ruby. Additionally, RuboCop will be employed to enforce coding conventions and provide static analysis to ensure adherence to best practices and consistent coding standards within the Ruby on Rails project.
- Implement interactors to perform basic operations such as create, update, delete, and bulk-delete.
- Translate the app to use the multilingual system (i18n).

Happy coding!

Best regards,
Abba David, Eng