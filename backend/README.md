## API

### Setup

For the initial setup, please follow these steps:

```
cd backend

bundle install

rails db:create
rails db:migrate RAILS_ENV=development
rails db:migrate RAILS_ENV=test
rails db:seed RAILS_ENV=development
rails db:seed RAILS_ENV=test
```

### Launching the API

To start the server, execute the following command:

```
cd backend
rails server
```

To launch the tests:

```
cd backend
rspec
```

### Api

| Method | Endpoint                  | Description                    |
| ------ | ------------------------- | ------------------------------ |
| GET    | /api/v1/products          | Get a list of products         |
| POST   | /api/v1/products          | Create a new product           |
| PATCH  | /api/v1/products          | Update an existing product     |
| DELETE | /api/v1/products          | Delete an existing product     |
| POST   | /api/v1/cart/subtotal     | Calculate the subtotal         |

#### POST /api/v1/cart/subtotal

Request:

| Param   | Description                               | Type    | Is Mandatory?       |
| ------- | ----------------------------------------- | ------- | ------------------- |
| id      | Product ID                                | integer | yes                 |
| quantity| Number of products to multiply by price   | integer | yes                 |

Response:

| Param          | Description                         | Type              |
| -------------- | ----------------------------------- | ----------------- |
| subtotal       | Calculate the subtotal detail       | floating number   |
| two_plus_one   | Returns true if it's 2X1 promotion  | boolean           |
| discount_price | Returns true if price has discount  | boolean           |
| promotion      | Returns name of the promotion       | string            |

### Architecture Overview

In a Ruby on Rails API project, the app directory organizes various components that handle different aspects of the application's logic and functionality.

Controllers handle incoming client requests, triggering interactors for business logic. Interactors communicate with boundaries for filtering or repositories for data access. Processed data is then formatted by presenters before returning to controllers. Models interact with repositories for database operations, ensuring maintainability. This architecture promotes modularity and facilitates testing.

| Layer             | Type           | Description                                                       |
| ----------------- | -------------- | ----------------------------------------------------------------- |
| Presenters        | Presentation   | Formats data for user interface display.                          |
| Controllers (API) | Application    | Handles incoming HTTP requests and manages responses.             |
| Interactors       | Business Logic | Contains logic for specific application actions.                  |
| Boundaries        | Business Logic | Implements filters for readings based on company and criteria.    |
| Repositories      | Data Layer     | Handles database interactions and queries for models.             |
| Models            | Data Layer     | Represents data structures and manages database interactions.     |

### Code Quality

To ensure the quality of the code, this project utilizes the following commands:
```
rubocop
```
