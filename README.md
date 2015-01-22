# Merch

## a shop that sells products

### to do:

1. Define my routes
	- in 'config/routes.rb' define RESTful routes for resources
2. generate Controller for primary resource (product)
	- define actions for endpoints (rails generate controller products index show new edit (dont need to create controller actions for create update or destroy because we don't need the corresponding views that will be created))
	- CRUD products
		- read - Before I can read any data I need a Model...
3.  Generate a model
	- product model will have a migration
	- list attributes in migration file
	- run 'rake db:migrate'
	- seed the DB
		- e.g. 'product.create({name: "coffee cup", price: "500"})'
	- 'rake db:seed'

4. Create some views for looking at the products

5. Create a form for adding data via browser

6. Handle create and update actions

7. Provide destroy functionality

---

8. Think about other resources (users)

## notes
### what is REST (and RESTfulness)

REpresentational State Transfer

it is technobabble for HTTP convention expressed through server side code