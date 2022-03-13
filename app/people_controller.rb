class PeopleController
  include PeopleMapper
  include PeoplePresenter
   
  CITY_CODE_MAP = {NYC: 'New York City', LA: 'Los Angeles'} 

  def initialize(params)
    @params = params
  end

  def normalize
    people_informations = normalize_people_information(@params)
    normalize_city_information!(people_informations)
    people_informations.sort_by! { |people_information| people_information[@params[:order]] }
    return present_people_informations(people_informations)
  end

  private

  def normalize_city_information!(data_array)
    data_array.each do |data|
      data[:city] = CITY_CODE_MAP[data[:city].to_sym] if CITY_CODE_MAP[data[:city].to_sym]
    end
  end

  attr_reader :params
end
