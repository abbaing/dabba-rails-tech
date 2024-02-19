## Frontend App

### Setup

For the initial setup, please follow these steps:

```
cd frontend

npm install
```

### Launching the App

To launch the app, execute the following command:

```
cd frontend
npm start
```

To launch the tests:

```
cd frontend
npm test
```

### Architecture Overview

In React, the app is structured into modules, with each module containing three folders: ```components```, ```routes```, and ```pages```.

| Folder       | Description                                                       |
|--------------|------------------------------------------------------------------ |
| components   | Reusable UI elements for the module.                              |
| routes       | Manages navigation within the module using paths.                 |
| pages        | Contains the main screens that users interact with specific URLs. |


### Code Quality

To ensure the quality of the code, this project utilizes the following commands:
```
npm run lint
npm run format
```
