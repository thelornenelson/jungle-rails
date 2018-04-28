# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Features

- Visitors can view product listings and view detailed product pages, with reviews
- Visitors can create user accounts
- Registered users can create product reviews, and delete any reviews they've created
- Admin can add products and categories

## Final Product

!["Main Page"](https://github.com/thelornenelson/jungle-rails/blob/master/docs/main-page.png)
!["Adding Review"](https://github.com/thelornenelson/jungle-rails/blob/master/docs/product-detail-adding-review.png)
!["Viewing Product Details"](https://github.com/thelornenelson/jungle-rails/blob/master/docs/product-detail-with-review.png)
!["Order Confirmation"](https://github.com/thelornenelson/jungle-rails/blob/master/docs/order-confirmation.png)

## Setup

1. Clone this repository
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Sign up for a Stripe account
7. Create `.env` file based on `.env.example`
8. Put Stripe (test) keys into appropriate `.env` vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Dependencies

* Rails 4.2
* PostgreSQL 9.x
* Stripe
