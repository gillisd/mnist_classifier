Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :mnist_images, only: [:index]

  scope '/mnist_images' do
    post 'label' => 'mnist_images#label'
  end
end
