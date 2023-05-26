require 'rspec'
require_relative '../lib/hotel_finder'

RSpec.describe HotelFinder do
  describe '.find' do
    let(:hotel_params) { 'hotel_x' }

    context 'when search is successful' do
      let(:search_results) { ["https://tripadvisor.com/#{hotel_params}", "https://booking.com/#{hotel_params}"] }

      before do
        search_service_instance = instance_double(SearchService, call: search_results)
        allow(SearchService).to receive(:new).with(hotel_params).and_return(search_service_instance)
      end

      it 'returns an array of search results' do
        expect(HotelFinder.find(hotel_params)).to eq(search_results)
      end
    end
  end
end
