class PagesController < ApplicationController
  def home
    @data_sets = DataSet.page params[:page]
    @archives = Archive.page params[:page]
  end

  def about
  end
end
