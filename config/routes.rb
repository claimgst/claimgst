Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope :posts do
    get   '/', to: 'posts#index'
    post  '/', to: 'posts#create'
    get   '/today', to: 'posts#today'
  end
end
