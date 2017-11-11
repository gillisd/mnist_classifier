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

require 'rails_helper'

RSpec.describe MnistImagesUser, type: :model do
  subject { create(:mnist_images_user) }

  it 'is valid' do
    expect(subject).to be_valid
  end
end
