####Select multiple records using checkboxes and delete them without page refresh.

Create a new rails application. Use `-T` to tell Rails not to create unit tests. Use `-d postgresql` to tell Rails to use Postgres instead of SQLite.

    rails new DestroyMultiple -T -d postgresql
  
Add gems to the Gemfile.

Install Rspec for testing

    rails generate rspec:install

Before you create your database, save desired database settings into the database.yml file. Then run

    rake db:create

Setup database cleaner
    mkdir spec/config
    touch spec/config/database_cleaner.rb

Generate scaffold for Widgets

    rails generate scaffold Widget name:string description:string
  
Now run `rake db:migrate`

Remember to delete the index.html file from your public folder.

    rm public/index.html

And now modify your routes.rb file to root_to the Widgets 'index'

    #paste this line into your config/routes.rb file
    root to: 'widgets#index'

Create a rake task to populate your database with at least 1 Widget record.

    touch lib/tasks/sample_data.rake

