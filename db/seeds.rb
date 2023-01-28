# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'json'
require 'open-uri'

# json_films = JSON.parse(URI.open('http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>').read)
# url_paths = []
# json_films['results'].each do |film|
#   url_paths << "https://image.tmdb.org/t/p/w500#{film['backdrop_path']}"
# end

# rating: rand(5.0..10.0).round(1)

# yemi - httparty

puts 'destroying database'
Movie.destroy_all

puts 'creating database'

json_films = JSON.parse(URI.open('http://tmdb.lewagon.com/movie/top_rated').read)
json_films['results'].each do |film|
  Movie.create(
    title: film['title'],
    overview: film['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{film['backdrop_path']}",
    rating: film['vote_average']
  )
  puts 'seeded'
end
