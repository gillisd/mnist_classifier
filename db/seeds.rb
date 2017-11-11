# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |n|
  Dir.glob("db/mnist_pngs/#{n}/*.png") do |png|
    encoded_image = Base64.strict_encode64(open(png).read)
    MnistImage.create(base64_string: encoded_image, label: n)
  end
end
puts 'successfully seeded images'
