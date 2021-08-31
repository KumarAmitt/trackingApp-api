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

### 4. Current user logout / sign out

Delete request
> /logout

Example:

```bigquery
DELETE: /logout

Response:

{
    "status": 200,
    "logged_out": true
}

```


### 5. To get all the products available

Get Request

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

### 6. To get the specific product
Get Request

> /products/:id

Example:

```bigquery
GET: /products/2

{
    "product": {
        "id": 2,
        "product_name": "Small Business Insurance",
        "created_at": "2021-08-23T08:56:08.571Z",
        "updated_at": "2021-08-23T08:56:08.571Z"
    },
    "user": {...},
    "status": "ok"
}
```

### 7. To get all the deals associated with current user 
#### Require user to be signed-in

Get Request:

> /deals

It returns all the deals date-wise and product wise

Example:
```bigquery
{
  all: {
    '2021-08-29': [
      {
        user_id: 1,
        product_id: 3,
        premium: 2000,
        application_id: 'APL006',
        ...
      },
          ...
    ],
      ...
  },
  progress: {
    sum_premium: 132997,
    items: {
      'Commercial Vehicle': [
        {
          user_id: 1,
          product_id: 3,
          premium: 2000,
          application_id: 'APL006',
          ...
        },
        ...
      ],
      ...
    }
  },
  status: 'ok'
}
```

### 8. Create New deal (For logged in user)

Post Request

> /products/:product_id/deals

Provide the deal data
```bigquery
{
    product_id: <product_id>,
    application_id: <application_id>,
    premium: <premium>,
}
```

Example
```bigquery
POST: /products/1/deals

{
    "product_id": 1,
    "application_id": "APL001",
    "premium": 7700,
}
```

### 9. Update an specific deal
Patch Request
> /products/:product_id/deals/:deal_id

Provide the updated data

```bigquery
{
    product_id: <updated_product_id>,
    application_id: <updated_application_id>,
    premium: <updated_premium>,
}
```

### 10. Delete a deal
Delete Request
> /products/:product_id/deals/:deal_id


## Built With 🛠

```
- Ruby: 3.0.0
- Ruby on Rails: 6.1.4
- Postgresql
```

## Install ⏳

> Follow below steps to Run it on your local machine

1. - [ ] Open your `Terminal`
2. - [ ] Navigate to the directory where you will like to install the repo by running `cd FOLDER-NAME`
3. - [ ] Run `https://github.com/KumarAmitt/trackingApp-api.git` to clone the Repository
4. - [ ] Run `cd trackingApp-api.git` to enter directory
5. - [ ] Run `git checkout api` to switch to the feature branch
6. - [ ] Run `bundle install` to install Ruby Gems
7. - [ ] Run `yarn install --check-files` to install yarn
8. - [ ] Run `rails db:create` to create your database
9. - [ ] Run `rails db:migrate` to migrate your database
10.- [] Run `rails db:seed` to pre-populate database with some dummy data  
11. - [ ] Run `rails s` to get the server running
12. - [ ] Enter `http://localhost:3000/` in the browser to get the app running

## Testing

In order to run the tests, RSPEC should be installed.

- Please run the following command line in your terminal to install :

```bash
gem install rspec
```
Run from terminal
```bash
rspec
```

## Author

### 👨‍💻 Amit Kumar

- GitHub: [@KumarAmitt](https://github.com/KumarAmitt)
- Twitter: [@ArrshAmit](https://twitter.com/ArrshAmitt)
- LinkedIn: [@kumar-amitt](https://www.linkedin.com/in/kumar-amitt)

### 🤝 Contributing

Contributions, issues and feature requests are welcome!

- Fork the project
- Create your feature branch `git checkout -b feature`
- Commit your changes `git commit -m 'feature'`
- Push it `git push -u origin feature`
- Open a pull request using this branch


Feel free to check the [issues page](https://github.com/KumarAmitt/trackingApp-api/issues).

### Show your support

Give a ⭐️ if you like this project!

### License

&copy; 2021 Amit Kumar

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE.












