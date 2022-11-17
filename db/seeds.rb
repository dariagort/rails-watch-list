# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri"

url = "https://tmdb.lewagon.com/movie/top_rated?"
user_serialized = URI.open(url).read
movies = JSON.parse(user_serialized)['results']

movies.each do |movie|
  movie = Movie.create!(
    title: movie['original_title'],
    overview: movie['overview'],
    rating: movie['vote_average'],
    poster_url: movie['poster_path']
  )
end

