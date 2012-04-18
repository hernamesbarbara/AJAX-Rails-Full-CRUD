RSpec.configure do |config|
  
  #config.use_transactional_fixtures = false
  
  config.before(:each) do
    if example.metadata[:js]
      Capybara.current_driver = :selenium
      DatabaseCleaner.strategy = :truncation
    else
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.start
    end
  end
 
   config.after do
     DatabaseCleaner.clean
  end
end