class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all.order({:created_at => :desc})
    render({:template => "/photo_templates/index.html.erb"})
  end

  def show
    photo_id = params.fetch("photo_id")
    @photo = Photo.where(:id => photo_id).first
    @comments = @photo.comments
    render({:template => "/photo_templates/show.html.erb"})
  end

  def kill
    photo_id = params.fetch("photo_id")

    photo = Photo.where({:id => photo_id}).first
    photo.destroy
    # TODO: Delete comments
    redirect_to("/photos")
  end
end