# == Schema Information
#
# Table name: mnist_images
#
#  id            :integer          not null, primary key
#  label         :string
#  base64_string :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class MnistImage < ApplicationRecord
  validates_presence_of [:label, :base64_string]
  has_many :mnist_images_users
  has_many :users, through: :mnist_images_users
end
