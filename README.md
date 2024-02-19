# Marketplace

## Project Overview

Hello there! This project showcases React and Ruby on Rails architecture, emphasizing the design of components using SOLID principles under a modularized architecture. The main goal of this app is to let you see how different pieces work together in a simple marketplace. You can add products to a cart and find out the sub-total price easily.

## Technology Stack Overview

The Marketplace project has been developed using the following technologies:

  - Backend Stack:
    - [Ruby](https://www.ruby-lang.org/) "3.2.3"
    - [Ruby on Rails](https://rubyonrails.org/) "7.1.2"
    - [SQLite](https://www.sqlite.org/) "1.4"
    - [RSpec gem](https://rspec.info/) (for running tests)

  - Frontend Stack:
    - [Node.js](https://nodejs.org/)
    - [TypeScript](https://www.typescriptlang.org/)
    - [React](https://react.dev/)
    - [Webpack](https://webpack.js.org/)
    - [Jest package](https://jestjs.io/) (for running tests)

  - End-to-End Testing Stack:
    - [Cypress](https://www.cypress.io/) (for end-to-end tests)

  - Containerized Development Stack:
    - [Docker](https://www.docker.com/)
    - [Kubernetes](https://kubernetes.io/)

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

3. **Start the App:**

    If you use Linux, type this and press Enter:

      ```bash
      ./start-app.sh
      ```

    If you use Windows, type this and press Enter:

      ```bash
      start-app.bat
      ```

    This will do a bunch of things: making containers, setting up the database, and starting the app. 

    When it's done, you can open the app in your web browser at [localhost](http://localhost:8080).

4. **Without Docker? Manual execution is an option:**

    For backend documentation, please refer to: [Read the backend documentation](backend/README.md)

    For frontend documentation, please refer to: [Read the frontend documentation](frontend/README.md)

    Also end-to-end documentation, please refer to: [Read the E2E documentation](e2e/README.md)

## Next Steps

There are some tasks yet to be completed, including:

- In order to enhance code quality and maintainability, the task involves implementing method signatures using Sorbet for optional static typing in Ruby.
- Translate the app to use the multilingual system (i18n).
- Measure code coverage, aiming to cover at least 70% with unit tests and integration tests.

Happy coding!
Abba David, Eng.