## End-to-End Testing Project

### Setup

Ensure you have Node.js installed on your system:

```
cd e2e
npm install
```

### How to Run

This project is designed for end-to-end (E2E) testing purposes.
Before running the tests, ensure both the front-end and back-end are running.

```
cd e2e
npm test
```

### Project Structure Preview

#### Cypress

Cypress is a testing tool specifically designed for web applications. I chose it because it offers a user-friendly interface and powerful features for writing and running tests. With Cypress, tests can be executed directly within the browser environment, providing real-time feedback and ensuring the reliability and functionality of web applications.

| Folder   | Description                                               |
| -------- | --------------------------------------------------------- |
| e2e      | Contains end-to-end test scripts.                         |
| fixtures | Holds static test data.                                   |
| support  | Includes utility functions and custom commands for tests. |
