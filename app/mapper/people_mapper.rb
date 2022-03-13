module PeopleMapper

  DATE_FIELDS = [:birthdate]

  def normalize_people_information(people_informations_in_raw_format)
    normalized_people_information = []
    input_formats = [
      {
        format_type: :dollar_format,
        delimiter: '$'
      },
      {
        format_type: :percent_format,
        delimiter: '%'
      }
    ]
    input_formats.each do |input_format|
      normalized_people_information += get_people_informations(people_informations_in_raw_format, input_format)
    end
    return normalized_people_information
  end

  def get_people_informations(people_informations_in_raw_format, input_format)
    rows = people_informations_in_raw_format[input_format[:format_type]].split("\n")
    header_row = rows[0].split(input_format[:delimiter]).map(&:strip).map(&:to_sym)
    people_data_rows = rows[1..rows.size]
    normalized_people_informations = []
    people_data_rows.each do |row|
      normalized_people_info = {}
      columns = row.split(input_format[:delimiter])
      columns.each_with_index do |value, header_position|
        if DATE_FIELDS.include?(header_row[header_position])
          normalized_people_info[header_row[header_position]] = Date.parse(value.strip)
        else
          normalized_people_info[header_row[header_position]] = value.strip
        end
      end
      normalized_people_informations << normalized_people_info
    end
    normalized_people_informations
  end
end
