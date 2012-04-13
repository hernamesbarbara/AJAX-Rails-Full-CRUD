namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task['db:reset'].invoke

    puts "Creating 10 Widgets..."
    
    10.times do |n|
      Widget.create!( name: "Widget #{n}", description: "it has a description" )
    end
    
    puts "Done Creating Widgets."
    
    widgets=Widget.all(limit:5)
    
    
    puts "Creating 5 Gadgets..."
    
    5.times do |n|
      gadget_name="Gadget #{n}"
      widgets.each {|widget| widget.gadgets.create!(name: gadget_name)}
    end
    
    puts "Done Creating Gadgets."
    
  end
end