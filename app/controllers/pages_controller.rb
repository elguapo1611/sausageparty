class PagesController < ApplicationController
  def index
    @data_points = DataPoint.limit(100).order("created_at DESC")
    @data_points = @data_points.where("created_at > ?", params[:created_at]) if params[:created_at]
    respond_to do |format|
      format.json do
        render :json => @data_points.to_json
      end
      format.html
    end
  end
end
