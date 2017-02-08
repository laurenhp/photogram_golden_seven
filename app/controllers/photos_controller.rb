class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @photo= Photo.find_by({ :id => params[:id]})
    @photo_source = @photo.source
    @photo_caption = @photo.caption
    @photo_id = @photo.id

    render("photos/show.html.erb")
  end

def new_form

end

def create_row
  p = Photo.new
  p.caption = params[:caption]
  p.source = params[:source]
  p.save

  redirect_to("http://localhost:3000/photos/")

end

def destroy
p = Photo.find_by(params[:id])
p.destroy

redirect_to("http://localhost:3000/photos")
end

def edit_form
  @photo= Photo.find_by({ :id => params[:id]})
  render("photos/edit_form.html.erb")

end

def update_row

  m = Photo.find_by({ :id => params[:id]})
  m.caption = params[:the_new_caption]
  m.source = params[:the_new_source]
  m.save
  @photo= Photo.find_by({ :id => params[:id]})
  @photo_id = @photo.id

  redirect_to("http://localhost:3000/photos/#{@photo.id}")
end


end
