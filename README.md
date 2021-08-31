# Deals Tracker API
This is the backend API for Deals Tracker App with user authentication feature.
It returns the response in JSON format.

## URL

[Base URL:](https://deals-tracker.herokuapp.com)

> https://deals-tracker.herokuapp.com


## API Reference

### About

Base URL returns brief introduction about the API:

> https://deals-tracker.herokuapp.com


Result:

> {"about":"This is the API for tracking deals and premium collected by sales executives in a fictitious Insurance company","status":"It's working!!"}

### 1. New user Registration / Sign Up

Post Request:

> /registrations

Provide the user data
 
```bigquery
{
   user: {
        username: <username>,
        password: <password>,
        password_confirmation: <password>,
      },
}
```

Example:
```bigquery
POST: /registrations

{
    "user": {
        "username": "user303",
        "password": "asdf",
        "password_confirmation": "asdf"
    }
}

Response:

{
    "status": "created",
    "user": {
        "id": 107,
        "username": "user303",
        "password_digest": "$2a$12$vGC7Wd3h2FJVZ.32jO3Vue/edvGGzk78Q1a.3o3huExL4KA6D68iW",
        "created_at": "2021-08-31T10:29:45.395Z",
        "updated_at": "2021-08-31T10:29:45.395Z"
    }
}
```

### 2. Existing user Login / Sign In

Post Request:

> /sessions

Send the user credentials
```bigquery
{
   user: {
        username: <username>,
        password: <password>,
      },
}
```

Example:

```bigquery
POST: /sessions

{
    "user": {
        "username": "user303",
        "password": "asdf"
    }
}

Response:

{
    "status": "created",
    "logged_in": true,
    "user": {
        "id": 107,
        "username": "user303",
        "password_digest": "$2a$12$vGC7Wd3h2FJVZ.32jO3Vue/edvGGzk78Q1a.3o3huExL4KA6D68iW",
        "created_at": "2021-08-31T10:29:45.395Z",
        "updated_at": "2021-08-31T10:29:45.395Z"
    }
}
```

### 3. Check whether the user is Logged in / Active session Information
Get Request:

> /logged_in

Example:
```bigquery
GET: /logged_in

Respons 1 (Active Session):

{
    "logged_in": true,
    "user": {
        ...
        ...
    }
}

Response 2 (Inactive Session):

{
    "logged_in": false,
}

```

### 4. To get all the products available

Get Request"

> /products

Example:

```bigquery
Get: /products

{
    "products": [
        {
            "id": 1,
            "product_name": "Private Car Insurance",
            "created_at": "2021-08-23T08:56:08.501Z",
            "updated_at": "2021-08-23T08:56:08.501Z"
        },
        {
            "id": 2,
            "product_name": "Bike Insurance",
            "created_at": "2021-08-23T08:56:08.512Z",
            "updated_at": "2021-08-23T08:56:08.512Z"
        },    
    ],
    "status": "ok"
}
```













