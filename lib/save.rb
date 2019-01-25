#Pour appeler la méthode save_email_list dans scrapper: Save.new.save_email_list(array_of_mails)
#Pour appeler la méthode get_emails_list dans gmail: Save.new.get_emails_list
#Todo : une méthode pour vider le csv
require 'csv'

class Save
# récupère Array de scrapper et enregistrer en CSV
# Renvoyer les entrées en CSV vers gmail
def self.save_email_list(array_of_mails)
  CSV.open("../db/email.csv", "a+") do |csv|
    #CSV.open("data2.csv", "a") {|csv| perform.each {|elem| csv << elem} }
    csv << array_of_cities
    #first row
    csv << array_of_mails
    #second row
    csv << array_of_state
    #third row
  end
end
def self.get_emails_list
  return array_data = CSV.read("../db/email.csv")
end

end

