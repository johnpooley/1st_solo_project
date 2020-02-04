require("pry-byebug")
require_relative('../models/artist.rb')
require_relative('../models/artwork.rb')
require_relative('../models/exhibition.rb')
require_relative('../models/time')


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

artist_test   = Artist.new({
  "name" => "Test",
  "date_of_birth" => "1900",
  "alive" => "true"
  })

artist_test.save()
artist_test.name = "testing"
artist_test.update


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

modern_toss.name = "More Modern Toss"
modern_toss.update()

sunflowers = Artwork.new({
  "title" => "Sunflowers",
  "exhibition_id" => pretty_pictures.id,
  "artist_id" => van_gogh.id,
  "date" => "1859",
  "description" => "a nice painting of some flowers",
  "image" => "https://en.wikipedia.org/wiki/Sunflowers_(Van_Gogh_series)#/media/File:Vincent_Willem_van_Gogh_127.jpg"
  })

sunflowers.save()

artwork_test = Artwork.new({
  "title" => "test art",
  "exhibition_id" => nice_sculptures.id,
  "artist_id" => artist_test.id,
  "date" => "1859",
  "description" => "a test",
  "image" => "https://en.wikipedia.org/wiki/Sunflowers_(Van_Gogh_series)#/media/File:Vincent_Willem_van_Gogh_127.jpg"
  })

artwork_test.save()

artwork_test2 = Artwork.new({
  "title" => "David",
  "exhibition_id" => nice_sculptures.id,
  "artist_id" => artist_test.id,
  "date" => "1859",
  "description" => "another test",
  "image" => "https://en.wikipedia.org/wiki/Sunflowers_(Van_Gogh_series)#/media/File:Vincent_Willem_van_Gogh_127.jpg"
  })

artwork_test2.save()

artwork_test2.exhibition = pretty_pictures.id
artwork_test2.update


binding.pry
nil
