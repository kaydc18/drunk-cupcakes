# README

<h1>Drunk Cupcakes</h1>

* Drunk Cupcakes is a fun little tool that will convert your favorite cocktail into a cupcake recipe. I came up with the idea after my cohort kept requesting my drunk cupcake formula. Now I am sharing a version of that with everyone!


* A user can use a search form that either queries from the database or pulls a query from The Cocktail Database api. Once they select a drink, it will take them to a the recipe of that beverage. If a user is signed in or creates an account they will be able to save that recipe to a user profile.

[See Drunk Cupcakes online](https://drunkcupcakes.herokuapp.com)

<h2>Future Improvements</h2>

* Adding the ability for a user to give a review on a cupcake recipe

* Creating a way for a user to submit their own cupcake creations, or create a copy to update from the database.

<h2>Developer</h2>

Kaylyn DiCiaccio

<h3>Created Using</h3>

* Ruby-2.6.5

* Rails-5.2.3

* PostgreSQL-13

<h3>Set Up</h3>

* Clone Repo
```
git clone
```
* Install Dependencies
```
yarn install
```
```
bundle install
```
* Create and seed database
```
bundle exec rake db: migrate
```
```
bundle exec rake db: seed
```
* Run test suite
```
bundle exec rspec
```
* Start Rails server and webpack
```
bundle exec rails s
```
```
yarn run start
```
You can view locally here: <http://localhost:3000>





[![Codeship Status for kaydc18/drunk-cupcakes](https://app.codeship.com/projects/8ff21815-d233-475c-bb3c-b993fb09c548/status?branch=main)](https://app.codeship.com/projects/416577)
