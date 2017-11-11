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
end
