require("pry-byebug")
require_relative('../models/artist.rb')
require_relative('../models/artwork.rb')
require_relative('../models/exhibition.rb')

Artwork.delete_all()
Artist.delete_all()
Exhibition.delete_all()

picasso = Artist.new({
  "name" => "Picasso",
  "date_of_birth" => "1902",
  "alive" => "false"
  })

picasso.save()

van_gogh = Artist.new({
  "name" => "Van Gogh",
  "date_of_birth" => "1809",
  "alive" => "false"
    })

    van_gogh.save()

derek_riggs   = Artist.new({
  "name" => "Derek Riggs",
  "date_of_birth" => "1958",
  "alive" => "true"
  })

derek_riggs.save()


pretty_pictures = Exhibition.new({
  "name" => "Pretty Pictures",
  "info" => "a collection of pictures that are pretty",
  "active" => "true"
  })

pretty_pictures.save()

nice_sculptures = Exhibition.new({
"name" => "Nice Sculptures",
"info" => "a collection of sculptures that are nice",
"active" => "true"
})

nice_sculptures.save()

modern_toss = Exhibition.new({
"name" => "Modern Toss",
"info" => "something something, Modern Art",
"active" => "false"
})

modern_toss.save()


sunflowers = Artwork.new({
  "title" => "Sunflowers",
  "exhibition_id" => pretty_pictures.id,
  "artist_id" => van_gogh.id,
  "date" => "1859",
  "description" => "a nice painting of some flowers"

  })

sunflowers.save()
