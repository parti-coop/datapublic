class Admin::AssetsController < AdminController
  protect_from_forgery

  def create
    @asset = Asset.new(asset_params)
    @asset.save
    respond_to do |format|
      format.json { render json: { image_url: url_for(@asset.file), file_url: rails_blob_path(@asset.file), asset_id: @asset.id } }
    end
  end

  def destroy
    @asset = Asset.find(params[:id])
    @asset.destroy
    respond_to do |format|
      format.json { render json: { status: :ok } }
    end
  end

  private

  def asset_params
    params.require(:asset).permit(:file).merge(user: current_user)
  end
end
