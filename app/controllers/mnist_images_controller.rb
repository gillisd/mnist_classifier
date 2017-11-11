class MnistImagesController < ApplicationController

  def index
    # return unlabeled images
    @mnist_images = MnistImage.includes(:mnist_images_users).where(
      mnist_images_users: { user_id: nil }).page(1).per(20)
    render json: @mnist_images
  end

  def label
    MnistImagesUser.find_or_initialize_by(
      mnist_image_id: permitted_params[:id],
      user_id: current_user.id
    ).tap do |mi_u|
      mi_u.user_label = permitted_params[:label]
    end.save!
    render json: { status: 'ok' }
  end

  def permitted_params
    params.require(:mnist_image).permit(:label, :id)
  end
end
