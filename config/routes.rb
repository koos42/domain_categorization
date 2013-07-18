PornOrNot::Application.routes.draw do

  root :to => 'static_pages#splash'

  get "static_pages/splash"

  match '/start_voting', to: 'domain_category_votes#index'

  match '/:domain_id/is_a/:category_slug', to: 'domain_category_votes#vote_for', as: 'it_is_a'
  match '/:domain_id/is_not_a/:category_slug', to: 'domain_category_votes#vote_against', as: 'it_is_not_a'
  post  '/they_are', to: 'domain_category_votes#votes_for', as: 'they_are'

  # one domain to one category
  match '/is_it_a', to: 'domain_category_votes#is_it_a'

  # one domain to many categories
  match '/which_categories', to: 'domain_category_votes#which_categories'

  # one category to many domains
  match '/which_domains', to: 'domain_category_votes#which_domains'

  resources :domains
  resources :categories
end
