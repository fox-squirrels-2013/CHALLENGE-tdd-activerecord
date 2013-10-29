## Active Record Resource Library
1. [Learning Objectives](#learning-objectives)
1. [Instructions](#instructions)

## Learning Objectives
1. Models and migrations for one to many relationships
1. Validations
1. Scopes to retrieve specific collections from the database

## Instructions
Clone this repo to your local machine and create a branch to work on.  

Run `rake db:migrate` to run your migration file. 

There are tests written for you in the files:

1. `spec/level_1_spec.rb`
1. `spec/level_2_spec.rb`
1. `spec/level_3_spec.rb`

Run `rake` to run the default rake task in your Rakefile which will run all tests.  

Change 1 `xit` to `it` at a time (starting with level 1) to move each test from pending to failing and then write the code to make it pass.  Be sure to commit your changes after each passing test.

Submit a pull request from your local branch to this repository before leaving for lunch so your peers
can review your code.

**DO NOT MERGE SOLUTION PULL REQUESTS INTO THIS REPOSITORY**

## Helpful Resources
1. [Shoulda Matchers](http://rubydoc.info/github/thoughtbot/shoulda-matchers/master/frames)
1. [Creating a table](http://guides.rubyonrails.org/migrations.html#creating-a-table)
1. [The ActiveRecord Migration docs](http://api.rubyonrails.org/classes/ActiveRecord/Migration.html)
1. [The Has Many Association](http://guides.rubyonrails.org/association_basics.html#the-has-many-association)
1. [The Has Many Through Association](http://guides.rubyonrails.org/association_basics.html#the-has-many-through-association)
1. [The Belongs To Association](http://guides.rubyonrails.org/association_basics.html#the-belongs-to-association)
1. [Scopes](http://guides.rubyonrails.org/active_record_querying.html#scopes)
