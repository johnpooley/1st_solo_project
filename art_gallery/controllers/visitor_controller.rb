require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist')
require_relative('../models/artwork')
require_relative('../models/exhibition')
require_relative('../models/time')


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

get '/visitor/visitor/exhibitions/' do
  @exhibitions_live = Exhibition.all_live()
  @exhibitions_done = Exhibition.all_done()
  erb(:'../views/visitor/exhibitions')
end

get '/visitor/exhibitions/:id' do
  @exhibition = Exhibition.find(params['id'].to_i)
  erb(:"visitor/exhibitions_show")
end

get '/visitor/previous_exhibitions' do
  # @exhibitions_live = Exhibition.all_live()
  @exhibitions_done = Exhibition.all_done()
  erb(:'../views/visitor/previous_exhibitions')
end





# artists

get '/visitor/artists' do
  @artists = Artist.all()
  erb(:'../views/visitor/artists')
end

get '/visitor/artists/:id' do
  @artist = Artist.find(params['id'].to_i)
  erb(:"visitor/artists_show")
end



# artworks

get '/visitor/artworks' do
  @artworks = Artwork.all()
  erb(:'../views/visitor/artworks')
end

get '/visitor/artworks/:id' do
  @artwork = Artwork.find(params['id'].to_i)
  erb(:"visitor/artworks_show")
end
