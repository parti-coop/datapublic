class RumorsController < ApplicationController
  before_action :set_rumor, only: [:show, :edit, :update, :destroy]

  def index
    @rumors = Rumor.all
    @rumors = @rumors.search_for(params[:q]) if params[:q].present?
    @rumors = @rumors.page(params[:page])
  end

  def new
    @rumor = Rumor.new
  end

  def create
    @rumor = Rumor.new(rumor_params)
    @rumor.user = current_user

    if @rumor.save
      redirect_to @rumor, notice: '저장하였습니다.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @rumor.update(rumor_params)
      redirect_to @rumor, notice: '수정하였습니다.'
    else
      render :edit
    end
  end

  def destroy
    @rumor.destroy
    redirect_to rumors_url
  end

  private

    def set_rumor
      @rumor = Rumor.find(params[:id])
    end

    def rumor_params
      params.require(:rumor).permit(
        :title, :body,
      )
    end
end
