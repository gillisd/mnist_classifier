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

require 'rails_helper'

RSpec.describe MnistImage, type: :model do
  subject { create(:mnist_image, label: '1') }

  describe '#update_state!' do


    it 'has the correct initial state' do
      expect(subject.state).to eq('not_user_labeled')
    end

    context 'when 2 users have incorrectly labeled the image' do
      before do
        2.times { create(:mnist_images_user, user_label: '2', mnist_image_id: subject.id) }
      end

      it 'transitions to state: needs_relabeling' do
        expect { subject.update_state! }.to change {
          subject.reload.state }.from('not_user_labeled').to('needs_relabeling')
      end

      it 'transitions to state: needs_investigation after 5 different users have labeled the image' do
        subject.update_state!
        5.times { create(:mnist_images_user, user_label: '2', mnist_image_id: subject.id) }
        expect { subject.update_state! }.to change {
          subject.reload.state }.from('needs_relabeling').to('pending_investigation')
      end

      it 'does not transitions to state: needs_investigation unless 5 different users have labeled the image' do
        subject.update_state!
        4.times { create(:mnist_images_user, user_label: '2', mnist_image_id: subject.id) }
        subject.update_state!
        expect(subject.reload.state).to eq('needs_relabeling')
      end

    end

    context 'when 2 users have correctly labeled the image' do
      before do
        2.times { create(:mnist_images_user, user_label: '1', mnist_image_id: subject.id) }
      end

      it 'transitions to state: correct' do
        expect { subject.update_state! }.to change {
          subject.reload.state }.from('not_user_labeled').to('correct')
      end
    end

    context 'when less than 2 users have labeled the image' do
      it 'transitions to state: correct' do
        subject.update_state!
        expect(subject.reload.state).to eq('not_user_labeled')
      end
    end
  end
end
