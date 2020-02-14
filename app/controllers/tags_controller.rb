class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def show
    @data_sets = DataSet.tagged_with(@tag)
  end

  def edit
  end

  def update
    @tag = ActsAsTaggableOn::Tag.find(params[:id])

    throw Exception

    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to tag_path(@tag), notice: t('Tag was successfully updated.') }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end

  end

  private

  def set_tag
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
  end

  def tag_params
    params.require(:acts_as_taggable_on_tag).permit(:id)
  end

end