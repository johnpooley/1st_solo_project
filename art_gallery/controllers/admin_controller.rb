require('sinatra')
require('sinatra/contrib/all')
# rewuire('')
require_relative('../models/artist')
require_relative('../models/artwork')
require_relative('../models/exhibition')
require_relative('../models/time')


get '/admin' do
  erb(:'../views/admin/index')
end

get '/admin/' do
  erb(:'../views/admin/index')
end

get '/admin/artists' do
  @artists = Artist.all()
  # @delete = Artist.delete()
  erb(:'../views/admin/artists')
end

get '/admin/artists/:id'do
@artist = Artist.find(params['id'].to_i)
erb(:"admin/artists_show")
# @delete = Artist.delete(params['id'].to_i)
end

get '/admin/artists/:id/edit'do
@artist = Artist.find(params['id'].to_i)
erb(:"admin/artists_edit")
end

post '/admin/artists/:id/edited' do
  artist = Artist.new(params)
  artist.update
  redirect to "/admin/artists"
end

get '/admin/artworks/:id/edit' do
  @artists = Artist.all()
  @exhibitions = Exhibition.all()
  @artwork = Artwork.find(params['id'].to_i)
  erb(:"admin/artworks_edit")
end

post '/admin/artworks/:id/edited' do
# binding.pry
  artwork = Artwork.new(params)
  artwork.update
  redirect to "/admin/artworks"
end


# add a new artist
get '/admin/newartist' do
  erb(:'../views/admin/new_artist')
end

post '/admin/newartist' do
  artist = Artist.new(params)
  artist.save
  redirect to("/admin")
end

post '/admin/artists/:id' do
  # artist = Artist.find(params['id'].to_i)
  Artist.delete(params['id'].to_i)
  redirect to("/admin/artists")
end


# artworks
get '/admin/artworks' do
  @artworks = Artwork.all()
  erb(:'../views/admin/artworks')
end

get '/admin/artworks/:id' do
  @artwork = Artwork.find(params['id'].to_i)
  erb(:'../views/admin/artworks_show')
end


get '/admin/newartwork' do
  @artists = Artist.all()
  @exhibitions = Exhibition.all()
  erb(:'../views/admin/new_artwork')
end

post '/admin/newartwork' do
  artwork = Artwork.new(params)
  artwork.save
  redirect to("/admin")
end



# exhibitions
get '/admin/exhibitions' do
  @exhibitions = Exhibition.all()
  # @delete = Artist.delete()
  erb(:'../views/admin/exhibitions')
end

get '/admin/newexhibition' do
  erb(:'../views/admin/new_exhibition')
end


post '/admin/newexhibition' do
  artist = Exhibition.new(params)
  artist.save
  redirect to("/admin")
end

get '/admin/exhibitions/:id/edit'do
@exhibition = Exhibition.find(params['id'].to_i)
erb(:"admin/exhibitions_edit")
end

post '/admin/exhibitions/:id/edited' do
  artist = Exhibition.new(params)
  artist.update
  redirect to "/admin/exhibitions"
end
