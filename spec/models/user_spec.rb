# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  session_id :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

  subject { create(:user) }

  it 'is valid' do
    expect(subject).to be_valid
  end
end
