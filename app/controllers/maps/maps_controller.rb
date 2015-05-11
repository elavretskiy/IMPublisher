class Maps::MapsController < Freelancer::BaseController
  before_action :set_map, only: [:destroy, :edit, :update, :show]

  respond_to :html, :js

  def index
    @maps = Map.all
  end

  def show
    @markers = build_markers
  end

  def new
    @map = Map.new
    @map.markers.build
  end

  def edit
    @markers = build_markers
  end

  def create
    @map = Map.new(map_params)
    if @map.save
      @markers = build_markers

      redirect_to edit_map_path(@map)
    else
      respond_with @map
    end
  end

  def update
    if @map.update(map_params)
      @markers = build_markers

      respond_to do |format|
        format.html { redirect_to edit_map_path(@map) }
        format.js
      end
    else
      respond_with @map
    end
  end

  def destroy
    @map.destroy
    respond_with @map
  end

  private

  def set_map
    @map = Map.find(params[:id])
  end

  def map_params
    params.require(:map).permit(:title,
                                markers_attributes: [:id, :title, :comment,
                                                     :latitude, :longitude,
                                                     :_destroy])
  end

  def build_markers
    @map_markers = @map.markers.all

    @markers = Gmaps4rails.build_markers(@map_markers) do |map_marker, marker|
      marker.lat map_marker.latitude
      marker.lng map_marker.longitude
      marker.title map_marker.title
      marker.infowindow map_marker.comment
      marker.picture({
                       url: 'https://maps.gstatic.com/mapfiles/ms2/micons/red-dot.png',
                       width:  36,
                       height: 36
                     })
    end
  end
end
