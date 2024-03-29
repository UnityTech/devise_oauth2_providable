Devise::Oauth2Providable::Engine.routes.draw do
  root :to => "authorizations#new"

  resources :authorizations, :only => :create
  match 'authorize' => 'authorizations#new', via: [:post, :get]
  resource :token, :only => :create
end
