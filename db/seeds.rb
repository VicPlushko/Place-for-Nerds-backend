# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

json = JSON.parse(File.read('app/assets/json/movies.json'))
movies = json['results']
movies.each do |movie_hash|
    Movie.create(
        title: movie_hash["title"],
        release_date: movie_hash["release_date"],
        synopsis: movie_hash["overview"],
        poster: movie_hash["poster_path"],
        movie_id: movie_hash["id"]
    )
end