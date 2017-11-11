# == Schema Information
#
# Table name: mnist_images_users
#
#  id             :integer          not null, primary key
#  mnist_image_id :integer          not null
#  user_id        :integer          not null
#  user_label     :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class MnistImagesUser < ApplicationRecord
  belongs_to :user
  belongs_to :mnist_image

  def self.label_by_user(mnist_image_id, user_id, label)
    mnist_images_user = find_or_initialize_by(
      mnist_image_id: mnist_image_id,
      user_id: user_id
    ).tap do |mi_u|
      mi_u.user_label = label
    end
    mnist_images_user.save!
    mnist_images_user.mnist_image.update_state!
  end


end
