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

require 'rails_helper'

RSpec.describe MnistImagesUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
