class DataSetsController < ApplicationController
  before_action :set_data_set, only: [:show, :edit, :update, :destroy]

  def index
    @data_sets = DataSet.all
    @data_sets = @data_sets.search_for(params[:q]) if params[:q].present?
    @data_sets = @data_sets.page(params[:page])
  end

  def new
    if params[:archive]
      @archive = Archive.find(params[:archive]) 
      @data_set = @archive.data_sets.build
    else
      @archive = Archive.new
      @data_set = DataSet.new
    end
  end

  def create
    @data_set = DataSet.new(data_set_params)
    @data_set.user = current_user

    if @data_set.save
      redirect_to @data_set, notice: '저장하였습니다.'
    else
      render :new
    end
  end

  def show
    @archive = @data_set.archive
  end

  def edit
  end

  def update
    if @data_set.update(data_set_params)
      redirect_to @data_set, notice: '수정하였습니다.'
    else
      render :edit
    end
  end

  def destroy
    @data_set.destroy
    redirect_to data_sets_url
  end

  private

    def set_data_set
      @data_set = DataSet.find(params[:id])
    end

    def data_set_params
      params.require(:data_set).permit(
        :archive_id, :title, :url, :api_url, :body, :tag_list,
        :publisher, :file_type, :properties, :data_created_at, :data_updated_at, :license, :memo,
        links_attributes: [:id, :title, :body, :url, :_destroy]
      )
    end
end
