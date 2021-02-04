class ArchivesController < ApplicationController
  before_action :set_archive, only: [:show, :edit, :update, :destroy]

  def index
    @archives = Archive.page(params[:page])
  end

  def new
    @archive = Archive.new
  end

  def create
    @archive = Archive.new(archive_params)
    @archive.user = current_user

    if @archive.save
      redirect_to @archive, notice: '저장하였습니다.'
    else
      render :new
    end
  end

  def show
    @data_sets = @archive.data_sets
    @links = Link.where(data_set: @data_sets)
  end

  def update
    if @archive.update(archive_params)
      redirect_to @archive, notice: '수정하였습니다.'
    else
      render :edit
    end
  end

  def destroy
    @archive.destroy
    redirect_to archives_url
  end

  private

  def set_archive
    @archive = Archive.find(params[:id])
  end

  def archive_params
    params.require(:archive).permit(:slug, :cover, :title, :body, :publisher)
  end
end
