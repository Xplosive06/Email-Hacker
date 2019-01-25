require 'nokogiri'
require 'open-uri'
# scrapper 3 départements

def get_cities_names(state_name, state_number)
  array_of_cities = Array.new
  state_number = state_number
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/" + state_name))
  page.css('a[href*="./#{state_number}/"]').each do |node|
    array_of_cities << node.text.downcase.tr(" ", "-")

  end
  return array_of_cities
end

def get_cities_emails(cities_names, state_number)
  cities_array = Array.new
  i = 0
  for city in cities_names
    i += 1
    puts i
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/" + state_number +"/" + city))
    #"https://www.annuaire-des-mairies.com/95/avernes.html"
    city_email = page.css('tbody tr:nth-child(4) td:nth-child(2)')

    city_email = city_email[0]

    cities_array << city_email.text

  end
  return cities_array
end

def return_state_array

end

print get_cities_names("bas-rhin", 67)
