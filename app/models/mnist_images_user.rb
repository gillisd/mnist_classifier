# == Schema Information
#
# Table name: mnist_images_users
#
#  id             :integer          not null, primary key
#  mnist_image_id :integer
#  user_id        :integer
#  label          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class MnistImagesUser < ApplicationRecord
  belongs_to :user
  belongs_to :mnist_image


end
