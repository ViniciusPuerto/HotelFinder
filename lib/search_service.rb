class SearchService
  require 'faraday'

  TRIPADVISOR_CSE = 'd1f07b175b1ea4480'
  BOOKING_CSE =  'f14520da7125c453f'
  HOLYDAYCHECK_CSE = 'c22eb452eefd64edc'

  def initialize(hotel_query)
    @hotel_query = hotel_query
  end

  def call
    run_search.values.map { |value| value[:link] }
  end

  private

  def cse_list
    [TRIPADVISOR_CSE, BOOKING_CSE, HOLYDAYCHECK_CSE]
  end

  def run_search
    search_results = {
      tripadvisor: {
        cse_id: TRIPADVISOR_CSE,
        link: nil
      },
      booking: {
        cse_id: BOOKING_CSE,
        link: nil
      },
      holydaycheck: {
        cse_id: HOLYDAYCHECK_CSE,
        link: nil
      }
    }

    cse_list.each do |cse_id|
      cse_response = Faraday.get("https://customsearch.googleapis.com/customsearch/v1?cx=#{cse_id}&exactTerms=#{@hotel_query}&num=1&key=AIzaSyBgpxk85RefWDvWOmQzMqh671iTVRoRjdw")

      if cse_response.status == 200
        cse_response_json = JSON.parse(cse_response.body)
        search_results.select { |k, v| v[:cse_id] == cse_id }.first[1][:link] = cse_response_json['items'][0]['link']
      end
    end

    search_results
  end
end