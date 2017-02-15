# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

*To generate a migration to create a table (in this example articles):

- rails generate migration create_articles

*To add attributes for the table in the migration file, add the following inside create_table block:

- t.string :title

- t.text :description

- t.timestamps

* To rollback a migration (undo the last migration):

- rake db:rollback

*To add a column (example: created_at column) to the articles table:

- rails generate migration add_created_at_to_articles

*Then within the def change method in the migration file:

- add_column :articles, :created_at, :datetime

***To test connection to the articles table: **

Article.all # classname.all will list all the articles in the articles table

Then simply type in Article (classname) to view the attributes

To create a new article with attributes title and description:

article = Article.new(title: "This is a test title", description: "This is a test description")

article.save

OR

article = Article.new

article.title = "This is a test title"

article.description = "This is a test description"

article.save

Another method to do the same:

article = Article.create(title: "This is a test title", description: "This is a test description") # This will hit the table right away without needing the article.save line



