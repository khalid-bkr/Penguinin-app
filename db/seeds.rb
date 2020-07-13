# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Country.create(name: "USA", death_count: 2000, case_count: 30000, recovery_count: 300)
# Country.create(name: "Russia", death_count: 2001, case_count: 30001, recovery_count: 301)
# Country.create(name: "Jordan", death_count: 2002, case_count: 30002, recovery_count: 302)
# Country.create(name: "UK", death_count: 2003, case_count: 30003, recovery_count: 303)

require "uri"
require "net/http"
require 'json'

url = URI("https://api.covid19api.com/summary")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)
# puts response.read_body
formated = JSON.parse(response.read_body)
countries = formated["Countries"]

countries.each { |c| Country.create(name: c["Country"], case_count: c["TotalConfirmed"], death_count: c["TotalDeaths"], recovery_count: c["TotalRecovered"])}
# puts countries
# Country.create(name: countries[1]["Country"], case_count: countries[1]["TotalConfirmed"], death_count: countries[1]["TotalDeaths"], recovery_count: countries[1]["TotalRecovered"])
