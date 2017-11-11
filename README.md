# Piper Challenge:  image classification
by David Gillis

## Challenge summary
Create a tool to aid volunteers in validating the labels in the MNIST dataset. 
The MNIST dataset contains images of hand drawn digits and their corresponding digit. 
 Suppose we would like to validate that the labels are accurate.  The system will present each digit to two different users.  If the user’s response both match the MNIST label, the label is considered correct.  If the responses differ, 
 collect 5 different users responses and flag the label for investigation.

## Technologies used
1. Rails 5.1.4
2. React + Redux
3. SQLite3

## Development environment setup
 1. Navigate to the project directory
 2. run `bundle install`
 3. run `yarn install`
 4. run `rake db:migrate`
 4. run `rake db:seed` to import the MNIST images and labels
 5. run `rails s` to start the web server
 6. run `webpack-dev-server` to start the front-end server
 7. navigate to `localhost:3000` in your browser
 
 If this isn't working, please feel free to call me and I'll happily try to help you set up the environment.

## Testing
 1. run `bundle exec rspec`
 
## Design details

#### States

The following states are used to classify the images. These states are found in the `state` column of 
the `mnist_images` table:

 1. `not_user_labeled`: the image has not been labeled by at least 2 users
 2. `correct` the image has been labeled by at least 2 users and these labels match the correct labels
 3. `needs_relabeling` the image has been labeled by at least 2 users and these labels do not match the correct labels
 4. `pending_investigation` the image was in the `needs_relabeling` state and has now been classified by 5 more different users
 
 This state flow has been thoroughly tested in `spec/mnist_image_spec`. Please see the testing instructions above on how to 
 run these tests.
 
 #### User sessions
 
 The user's session id is used to identify the user.