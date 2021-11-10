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

  def insert
    image = params.fetch("input_image")
    caption = params.fetch("input_caption")
    owner_id = params.fetch("input_owner_id")

    new_photo = Photo.new
    new_photo.image = image
    new_photo.caption = caption
    new_photo.owner_id = owner_id

    new_photo.save

    redirect_to("/photos/" + new_photo.id.to_s)
  end

  def update
    image_id = params.fetch("photo_id")
    new_image = params.fetch("input_image")
    new_caption = params.fetch("input_caption")

    photo = Photo.where({:id => image_id}).first
    photo.image = new_image
    photo.caption = new_caption

    photo.save

    redirect_to("/photos/" + image_id.to_s)
  end
end