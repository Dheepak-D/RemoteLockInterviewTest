require 'spec_helper'

RSpec.describe 'PeoplePresenter' do
include PeoplePresenter
  describe '#present_people_informations' do
    it 'should present people informations' do
      people_informations = [
        {
          first_name: 'sam1', city: 'New York City', birthdate: Date.parse("30-4-1974")
        },
        {
          city: 'New York City', first_name: 'sam2', last_name: 'dan', birthdate: Date.parse("1986-05-29")
        },
      ]
      expected_output = [
      	"sam1, New York City, 4/30/1974",
      	"sam2, New York City, 5/29/1986",
      ]
      expect(present_people_informations(people_informations)).to eq(expected_output)
    end
  end
end
