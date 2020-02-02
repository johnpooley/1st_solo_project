require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist')
require_relative('../models/artwork')
require_relative('../models/exhibition')

get '/visitor' do

  erb(:'../views/visitor/index')
end

get '/visitor/exhibitions' do
  @exhibitions = Exhibition.all()
  erb(:'../views/visitor/exhibitions')
end

get '/visitor/artworks' do
  @artworks = Artwork.all()
  erb(:'../views/visitor/artworks')
end

get '/visitor/artists' do
  @artists = Artist.all()
  erb(:'../views/visitor/artists')
end

get '/visitor/visitor/artists/:id' do
  @artist = Artist.find(params['id'].to_i)
  erb(:"visitor/artists_show")
end

get '/visitor/artworks' do
  @artworks = Artwork.all()
  erb(:'../views/visitor/artworks')
end

get '/visitor/visitor/artworks/:id' do
  @artwork = Artwork.find(params['id'].to_i)
  erb(:"visitor/artworks_show")
end
