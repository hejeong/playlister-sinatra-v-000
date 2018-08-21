class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'song/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'song/new'
  end

  post '/songs' do
    artist = Artist.find_or_create_by(name: params["Artist Name"])
    song = Song.create(params["Name"])
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'song/show'
  end
end
