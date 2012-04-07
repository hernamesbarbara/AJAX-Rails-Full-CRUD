namespace :db do
  
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    
    puts "*"*5 + "Creating 10 Widgets..." + "*"*5
      
    6.times do |n|
      widget_name=Faker::Company.name
      Widget.create!( name: widget_name,
                      description: Faker::Lorem.words(5) )
    end
  
    puts "*"*5 + "Creating 3 Gadgets per widget..." + "*"*5
    widgets=Widget.all
    3.times do |n|
      gadget_name = Faker::Lorem.words(3)
      widgets.each { |widget| widget.gadgets.create!(name: gadget_name) }
    end
  end
end