class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'song/index'
  end

  get '/songs/new' do
    erb :'song/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'song/show'
  end
end
