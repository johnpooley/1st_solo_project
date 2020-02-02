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
  artist = Artist.find(params['id'].to_i)
  artist.delete()
  redirect to("/admin/artists")
end
