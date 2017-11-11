desc 'imports first 100 MNIST images'
task :import_images => :environment do
  10.times do |n|
    Dir.glob("lib/training/#{n}/*.png") do |png|
      encoded_image = Base64.strict_encode64(open(png).read)
      MnistImage.create(base64_string: encoded_image, label: n)
    end
  end
end