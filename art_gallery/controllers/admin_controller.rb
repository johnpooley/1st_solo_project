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


# add a new artist
get '/admin/newartist' do
  erb(:'../views/admin/new_artist')
end

post '/admin/newartist' do
  artist = Artist.new(params)
  artist.save
  redirect to("/admin")
end
