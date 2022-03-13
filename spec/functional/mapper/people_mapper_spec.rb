require 'spec_helper'

RSpec.describe 'PeopleMapper' do
  include PeopleMapper
  describe '#normalize_people_information' do
    it 'should normalize_people_information' do
      people_informations_in_raw_format =       {
        dollar_format: File.read('spec/fixtures/people_by_dollar.txt'),
        percent_format: File.read('spec/fixtures/people_by_percent.txt'),
        order: :first_name
      }
      expected_output = [
        {
          city: 'LA',
          birthdate: Date.parse('30-4-1974'),
          last_name: 'Nolan',
          first_name: 'Rhiannon'
        },
        {
          city: 'NYC',
          birthdate: Date.parse('5-1-1962'),
          last_name: 'Bruen',
          first_name: 'Rigoberto'
        },
        {
          first_name: 'Mckayla',
          city: 'Atlanta',
          birthdate: Date.parse('1986-05-29'),
        },
        {
          first_name: 'Elliot',
          city: 'New York City',
          birthdate: Date.parse('1947-05-04'),
        }
      ]
      expect(normalize_people_information(people_informations_in_raw_format)).to eq(expected_output)
    end
  end

  describe '#get_people_informations' do
    it 'should get people informations for dollar_format' do
      people_informations_in_raw_format =       {
        dollar_format: File.read('spec/fixtures/people_by_dollar.txt'),
        percent_format: File.read('spec/fixtures/people_by_percent.txt'),
        order: :first_name
      }
      format = {
        format_type: :dollar_format,
        delimiter: '$'
      }
      expected_output = [
        {
          city: 'LA',
          birthdate: Date.parse('30-4-1974'),
          last_name: 'Nolan',
          first_name: 'Rhiannon'
        },
        {
          city: 'NYC',
          birthdate: Date.parse('5-1-1962'),
          last_name: 'Bruen',
          first_name: 'Rigoberto'
        }
      ]
      expect(get_people_informations(people_informations_in_raw_format, format)).to eq(expected_output)
    end

    it 'should get people informations for percent_format' do
      people_informations_in_raw_format =       {
        dollar_format: File.read('spec/fixtures/people_by_dollar.txt'),
        percent_format: File.read('spec/fixtures/people_by_percent.txt'),
        order: :first_name
      }
      format = {
        format_type: :percent_format,
        delimiter: '%'
      }
      expected_output = [
        {
          first_name: 'Mckayla',
          city: 'Atlanta',
          birthdate: Date.parse('1986-05-29'),
        },
        {
          first_name: 'Elliot',
          city: 'New York City',
          birthdate: Date.parse('1947-05-04'),
        }
      ]
      expect(get_people_informations(people_informations_in_raw_format, format)).to eq(expected_output)
    end

  end
end
