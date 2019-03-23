# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get 'goods/:id/departments', to: 'goods#departments', as: 'good_departments', constraints: { format: :js }
  resources :depreciations, only: %i[index create]
  resources :departments
  resources :properties
  resources :good_categories
  resources :good_sub_kinds
  resources :good_kinds
  resources :goods do
    resources :movements, only: :create
    resources :financial_movements, only: :create
  end
end
