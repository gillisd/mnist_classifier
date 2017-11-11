class MnistImagesController < ApplicationController

  def index
    # return unlabeled images
    @mnist_images = MnistImage.unlabeled_images_for_user(current_user).limit(20)
    render json: @mnist_images
  end

  def label
    MnistImagesUser.label_by_user(permitted_params[:id], current_user.id, permitted_params[:label])
    render json: { status: 'ok' }
  end

  def permitted_params
    params.require(:mnist_image).permit(:label, :id)
  end
end
