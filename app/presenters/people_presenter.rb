module PeoplePresenter
  def present_people_informations(people_informations)
    presentable_people_info = []
    people_informations.each do |people_info|
      presentable_people_info << [people_info[:first_name], people_info[:city], people_info[:birthdate].strftime("%-m/%-d/%Y")].join(", ")
    end
    return presentable_people_info
  end
end
