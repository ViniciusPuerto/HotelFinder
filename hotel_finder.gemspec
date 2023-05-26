Gem::Specification.new do |s|
  s.name        = 'hotel_finder'
  s.version     = '0.0.1'
  s.date        = '2023-05-26'
  s.executables = ['hotel_finder']
  s.summary     = "A simple hotel finder"
  s.description = "A hotel finder that show links from Tripadvisor, Booking and Holidaycheck of the hotel searched"
  s.authors     = ["Vinicius Porto"]
  s.email       = ''
  s.files       = ["lib/hotel_finder.rb", 'lib/search_service.rb']
  s.license     = 'MIT'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'webmock'
end