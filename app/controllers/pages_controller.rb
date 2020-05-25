class PagesController < ApplicationController
  def home
    @data_sets = DataSet.page(1)
    @archives = Archive.page(1)
  end

  def about
  end
end
