Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  
  scope :posts do
    get   '/', to: 'posts#index'
    post  '/', to: 'posts#create'
    get   '/today', to: 'posts#today'
    get   '/search/:abn/:date', to: 'posts#search'
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }

end
