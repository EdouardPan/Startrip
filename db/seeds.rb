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
  new_user.save!
  user_id_array.push(new_user.id)
end

photo_cloudinary = ["https://upload.wikimedia.org/wikipedia/commons/6/62/Starsinthesky.jpg",
  "https://sites.create-cdn.net/siteimages/36/4/9/364983/12/3/4/12343581/500x367.jpg?1464280292",
  "https://cdn.pixabay.com/photo/2016/03/09/09/37/stars-1245902_960_720.jpg",
"http://en.es-static.us/upl/2018/01/planet-artist.jpg",
"https://media3.s-nbcnews.com/i/newscms/2017_25/2049696/artist-s-rendition-of-planet-10-image-heather-roper-lpl_573724__d25e876e6c99af15819632d766b9dda6.png",
"https://cdni.rt.com/files/2017.11/article/5a04343bfc7e93916f8b4568.jpg",
"https://r.hswstatic.com/w_1024/gif/planet-host-star-orig.jpg",
"http://www.wallpaperawesome.com/wallpapers-awesome/wallpapers-planets-stars-galaxies-nebulae-sci-fi-awesome/wallpaper-space-planet-star-galaxy-nebula-sci-fi-awesome-56.jpg",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTL7zGa0C-J8jCq9x2Hl-aCmBOGjBV0Trmwl8qGF9iHPITLlk4wA"]

2.times do
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

  photo_cloudinary.sample(3).each do |photo|
    new_star.remote_photos_urls = photo
  end

  new_star.save!
end


puts "Shit is seeded"
