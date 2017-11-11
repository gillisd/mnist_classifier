# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  session_id :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
end
