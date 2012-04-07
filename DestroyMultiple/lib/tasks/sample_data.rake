namespace :db do
  
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task['db:reset'].invoke

      
    Widget.create!( name: "this is a widget",
                    description: "it has a description" )
    end
end