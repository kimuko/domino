Rails.application.routes.draw do

  root 'root#index'

  #scope ':locale', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/, defaults: { locale: "ja" } do
  scope ':locale', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
    get '' => 'root#index'
    resources :videos, only: [:index]
  end

  namespace :api do
    resources :acceptes, only: [:create]
  end

end
