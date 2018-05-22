# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

  array_of_constellations = [
    "Andromeda",
    "Antlia",
    "Apus",
    "Aquarius",
    "Aquila",
    "Ara",
    "Aries",
    "Auriga",
    "Boötes",
    "Caelum",
    "Camelopardalis",
    "Cancer",
    "Canes Venatici",
    "Canis Major",
    "Canis Minor",
    "Capricornus",
    "Carina",
    "Cassiopeia",
    "Centaurus",
    "Cepheus",
    "Cetus",
    "Chamaeleon",
    "Circinus",
    "Columba",
    "Coma Berenices",
    "Corona Austrina",
    "Corona Borealis",
    "Corvus",
    "Crater",
    "Crux",
    "Cygnus",
    "Delphinus",
    "Dorado",
    "Draco",
    "Equuleus",
    "Eridanus",
    "Fornax",
    "Gemini",
    "Grus",
    "Hercules",
    "Horologium",
    "Hydra",
    "Hydrus",
    "Indus",
    "Lacerta",
    "Leo",
    "Leo Minor",
    "Lepus",
    "Libra",
    "Lupus",
    "Lynx",
    "Lyra",
    "Mensa",
    "Microscopium",
    "Monoceros",
    "Musca",
    "Norma",
    "Octans",
    "Ophiuchus",
    "Orion",
    "Pavo",
    "Pegasus",
    "Perseus",
    "Phoenix",
    "Pictor",
    "Pisces",
    "Piscis Austrinus",
    "Puppis",
    "Pyxis",
    "Reticulum",
    "Sagitta",
    "Sagittarius",
    "Scorpius",
    "Sculptor",
    "Scutum",
    "Serpens",
    "Sextans",
    "Taurus",
    "Telescopium",
    "Triangulum",
    "Triangulum Australe",
    "Tucana",
    "Ursa Major",
    "Ursa Minor",
    "Vela",
    "Virgo",
    "Volans",
    "Vulpecula"]

scale = (1..100).to_a

user_id_array = []
star_id_array = []

10.times do
  new_user = User.new(
    email: Faker::Internet.email,
    username: Faker::Name.name_with_middle,
    password: '123456',
    human: [true, false].sample)
  #binding.pry

  new_user.save!
  user_id_array.push(new_user.id)
end

10.times do
  new_star = Star.new(
    user_id: user_id_array.sample,
    name: Faker::Name.first_name,
    constellation: array_of_constellations.sample,
    water: scale.sample,
    breathability: scale.sample,
    asteroid_attack: scale.sample,
    daylight: scale.sample,
    life_existence: [true, false, false, false, false].sample,
    description: "On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L'avantage du Lorem Ipsum sur un texte générique comme 'Du texte. Du texte. Du texte.' est qu'il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour 'Lorem Ipsum' vous conduira vers de nombreux sites qui n'en sont encore qu'à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d'y rajouter de petits clins d'oeil, voire des phrases embarassantes).",
    price_per_day: (100..1000).to_a.sample)
    new_star.save!
    star_id_array.push(new_star.id)
end

photo_cloudinary = ["Printed_Acoustic_Ceiling_Tile_Murals_1370-22_1024x1024",
  "celestial-ann-marie-bone",
  "undefined",
  "stjernehimmel",
  "image-251531-breitwandaufmacher-ihhg-251531",
  "space",
  "300px-LH_95",
  "images",
  "Starsinthesky"]

star_id_array.each do |id|
  puts "photo_name"
  p photo = photo_cloudinary.sample
  star = StarPhoto.new(
    star_id: id,
    photo: photo)
  p star
  star.save!
end

puts "Shit is seeded"
