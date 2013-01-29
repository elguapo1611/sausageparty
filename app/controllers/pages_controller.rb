class PagesController < ApplicationController
  def index
    @data_points = DataPoint.limit(100)
  end
end
