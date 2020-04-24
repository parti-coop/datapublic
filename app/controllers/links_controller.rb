class LinksController < ApplicationController
  def index
    @links = Link.order("id desc").page(params[:page])
  end
end