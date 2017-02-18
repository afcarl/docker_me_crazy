Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get '/launch', to: 'launch#new', :as => :new_launch
    post '/launch', to: 'launch#create', :as => :launch_create
    get '/launch/:launch', to: 'launch#show', :as => :show_launch
    get '/', to: 'launch#index', :as => :launch_index
    get '/launch/:launch/edit', to: 'launch#edit', :as => :edit_launch
end
