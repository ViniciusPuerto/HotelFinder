require 'rspec'
require 'webmock/rspec'
require 'spec_helper'
require_relative '../lib/search_service'

RSpec.describe SearchService do
  describe '#call' do
    let(:hotel_query) { 'hotel' }
    let(:search_service) { SearchService.new(hotel_query) }

    context 'when search is successful' do
      let(:tripadvisor_cse_response) { { 'items' => [{ 'link' => 'https://tripadvisor.com/hotel' }] }.to_json }
      let(:booking_cse_response) { { 'items' => [{ 'link' => 'https://booking.com/hotel' }] }.to_json }
      let(:holidaycheck_cse_response) { { 'items' => [{ 'link' => 'https://holidaycheck.com/hotel' }] }.to_json }

      before do
        stub_request(:get, /https:\/\/customsearch.googleapis.com\/customsearch\/v1\?/)
          .to_return(status: 200, body: tripadvisor_cse_response)
          .to_return(status: 200, body: booking_cse_response)
          .to_return(status: 200, body: holidaycheck_cse_response)
      end

      it 'returns an array of links from the search results' do
        expect(search_service.call).to contain_exactly(
          'https://tripadvisor.com/hotel',
          'https://booking.com/hotel',
          'https://holidaycheck.com/hotel'
        )
      end
    end

    context 'when search fails' do
      before do
        stub_request(:get, /https:\/\/customsearch.googleapis.com\/customsearch\/v1\?/)
          .to_return(status: 500, body: '')
      end

      it 'returns an empty array' do
        expect(search_service.call).to eq([nil, nil, nil])
      end
    end
  end
end
