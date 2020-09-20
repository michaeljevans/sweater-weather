RSpec.describe MapQuestService do
  scenario 'returns location information' do
    VCR.use_cassette('map_quest_denver_co', re_record_interval: 7.days) do
      location = 'denver, co'
      service = MapQuestService.new
      location_info = service.get_location_information(location)

      expect(location_info.class).to eq(Hash)
      expect(location_info).to have_key(:results)
      expect(location_info[:results].first).to have_key(:locations)
      expect(location_info[:results].first[:locations].first).to have_key(:adminArea5)
      expect(location_info[:results].first[:locations].first[:adminArea5]).to eq('Denver')
      expect(location_info[:results].first[:locations].first).to have_key(:adminArea3)
      expect(location_info[:results].first[:locations].first[:adminArea3]).to eq('CO')
      expect(location_info[:results].first[:locations].first).to have_key(:adminArea1)
      expect(location_info[:results].first[:locations].first[:adminArea1]).to eq('US')
      expect(location_info[:results].first[:locations].first).to have_key(:latLng)
      expect(location_info[:results].first[:locations].first[:latLng]).to have_key(:lat)
      expect(location_info[:results].first[:locations].first[:latLng][:lat]).to eq(39.738453)
      expect(location_info[:results].first[:locations].first[:latLng]).to have_key(:lng)
      expect(location_info[:results].first[:locations].first[:latLng][:lng]).to eq(-104.984853)
    end
  end
end
