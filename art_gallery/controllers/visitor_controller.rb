require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist')
require_relative('../models/artwork')
require_relative('../models/exhibition')

get '/visitor' do

  erb(:'../views/visitor/index')
end

get '/visitor/' do

  erb(:'../views/visitor/index')
end


# exhibitions

get '/visitor/exhibitions' do
  @exhibitions_live = Exhibition.all_live()
  erb(:'../views/visitor/exhibitions')
end

get '/visitor/visitor/exhibitions/:id' do
  @exhibition = Exhibition.find(params['id'].to_i)
  erb(:"visitor/exhibitions_show")
end



# artists

get '/visitor/artists' do
  @artists = Artist.all()
  erb(:'../views/visitor/artists')
end

get '/visitor/visitor/artists/:id' do
  @artist = Artist.find(params['id'].to_i)
  erb(:"visitor/artists_show")
end

# artworks

get '/visitor/artworks' do
  @artworks = Artwork.all()
  erb(:'../views/visitor/artworks')
end

get '/visitor/visitor/artworks/:id' do
  @artwork = Artwork.find(params['id'].to_i)
  erb(:"visitor/artworks_show")
end