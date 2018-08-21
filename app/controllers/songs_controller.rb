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
    puts params
    @song = Song.create(params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'song/show'
  end
end
