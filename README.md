# Shopify 2019 Intern Challenge
Barebones server-side api for an online vegetable store with the basic functionality of viewing all products, available inventory, and purchasing a product.

The API uses a mysql database by default, and it can be tested by connecting to your own database.

## INSTALLING THE DEPENDENCIES
```bash
$ bundle install
```

## RUN DATABASE MIGRATION
```bash
$ rails db:migrate
```

## RUNNING THE SERVER
```bash
$ rails s
```

## API FUNCTIONS AND ENDPOINTS

These examples are shown with the API running on the local server.

### GET REQUESTS

Querying for all products
```
http://localhost:3000/api/v1/products/
```


Adding an argument for only available products
```
http://localhost:3000/api/v1/products/avail
```


Querying for one product
```
http://localhost:3000/api/v1/products/Artichoke
```

### PUT REQUESTS


Purchasing one product
```
http://localhost:3000/api/v1/products/purchase/Artichoke
```


## Built With
* [Ruby on Rails] (https://rubyonrails.org/ - The web framework used
* [Faker](https://github.com/stympy/faker) - Seed the database with fake vegetable data

## Author
* Shael Minuk
