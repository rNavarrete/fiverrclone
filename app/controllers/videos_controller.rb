class VideosController < ApplicationController

	def index
		@videos = Video.all
	end

	def new
    @videos = Video.new
  end
  
  def show
    @video = Video.find(params[:id])
  end
  
  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to root_url, notice: 'Video was successfully created.' }
        format.json { render action: 'show', status: :created, location: @video }
      else
        format.html { render action: 'new', notice: 'Try again.' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def video_params
    params.require(:video).permit(:url, :description, :UserId)
  end
end
