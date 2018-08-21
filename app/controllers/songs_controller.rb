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
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    #@song.genre_ids = params[:genres]
    @song.save
    puts @song.artist.slug
    #redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'song/show'
  end
end
