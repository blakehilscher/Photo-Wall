class PhotosController < ApplicationController
  
  def index
    respond_with @photos = Photo.page(params[:page]).per(16)
  end
  
  def random
    # ensure that the seed is a single place decimal
    seed = Float(params[:seed].to_i % 10) / 10
    # use the seed to ensure pagination is performed without duplicates
    Photo.connection.execute "select setseed(#{seed})"
    # perform the search using random and the seed
    respond_with @photos = Photo.order('random()').page(params[:page]).per(16)
  end
  
  def show
    respond_with @photo = Photo.find(params[:id])
  end
  
end