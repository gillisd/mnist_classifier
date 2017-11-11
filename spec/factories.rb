FactoryBot.define do
  factory :mnist_image do
    base64_string { SecureRandom.hex }
    label { rand(9) }
  end

  factory :user do
    session_id { SecureRandom.hex }
  end

  factory :mnist_images_user do
    user
    mnist_image
    user_label { rand(9) }
  end
end