# == Schema Information
#
# Table name: mnist_images
#
#  id            :integer          not null, primary key
#  label         :string           not null
#  base64_string :text             not null
#  state         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class MnistImage < ApplicationRecord
  include AASM
  validates_presence_of [:label, :base64_string, :state]
  has_many :mnist_images_users
  has_many :users, through: :mnist_images_users

  aasm column: :state do
    state :not_user_labeled, initial: true
    state :correct
    state :needs_relabeling
    state :pending_investigation

    event :set_to_correct do
      transitions from: :not_user_labeled, to: :correct, guard: :is_correct?
    end

    event :set_to_relabel do
      transitions from: :not_user_labeled, to: :needs_relabeling, guard: :is_relabelable?
    end

    event :set_to_investigate do
      transitions from: :needs_relabeling, to: :pending_investigation, guard: :is_investigatable?
    end
  end

  def self.unlabeled_images_for_user(user)
    joins("LEFT JOIN mnist_images_users AS miu ON mnist_images.id = miu.mnist_image_id AND miu.user_id = #{user.id}")
      .where('miu.mnist_image_id IS NULL').where(state: 'not_user_labeled')
  end

  def update_state!
    set_to_correct! if may_set_to_correct?
    set_to_relabel! if may_set_to_relabel?
    set_to_investigate! if may_set_to_investigate?
  end

  def is_correct?
    return false if user_labels.count < 2
    user_labels.each do |user_label|
      return false unless user_label == label
    end
    true
  end

  def is_investigatable?
    user_labels = mnist_images_users.pluck(:user_label)
    return false if user_labels.count < 7
    true
  end

  def is_relabelable?
    return false if user_labels.count < 2
    return false if is_correct?
    true
  end

  def user_labels
    mnist_images_users.pluck(:user_label)
  end

end
