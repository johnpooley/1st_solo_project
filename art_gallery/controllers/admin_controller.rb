require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist')
require_relative('../models/artwork')
require_relative('../models/exhibition')

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
