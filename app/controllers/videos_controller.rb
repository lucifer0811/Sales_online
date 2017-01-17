class VideosController < ApplicationController

  def index
    ziggeo = Ziggeo.new(ENV["ZIGGEO_KEY"], ENV["ZIGGEO_SECRET"], ENV["ZIGGEO_ENCRYPTION"])
    @videos = ziggeo.videos.index(tags: current_user.uid)
  end

  def destroy
    video = current_user.videos.find_by uid: params[:id]
    if video
      ziggeo = Ziggeo.new(ENV['ZIGGEO_KEY'], ENV['ZIGGEO_SECRET'], ENV['ZIGGEO_ENCRYPTION'])
      ziggeo.videos.delete video.uid
      flash[:success] = t "views.video.flash.success"
    else
      flash[:warning] = t "views.video.flash.warning"
    end
    redirect_to root_path
  end
end
