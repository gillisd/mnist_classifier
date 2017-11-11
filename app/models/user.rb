# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  session_id :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates_presence_of :session_id
  has_many :mnist_images_users
  has_many :mnist_images, through: :mnist_images_users
end
