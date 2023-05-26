require_relative 'search_service' 

class HotelFinder
  def self.find(hotel_params)
    search_service ||= SearchService.new(hotel_params)

    search_service.call
  end
end