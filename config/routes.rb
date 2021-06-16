Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions' }
  devise_scope :user do
    get '/users', to: redirect("/users/sign_up")
    get 'profile_edit', to: 'users/registrations#profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update'
  end

  get 'users/profile' => 'users#show'
  get 'users/account' => 'users#account_show'

  root 'properties#top' #TOPページ
  get 'properties/search' => 'properties#search' #物件情報検索
  get 'properties/posts' => 'properties#posts' #物件情報詳細・予約画面
  get 'bookings/result' => 'bookings#result' #物件予約結果画面
  get 'booking/list' => 'bookings#index' #物件予約済み一覧画面

  resources :properties, only: [:new, :show, :create] #properties(ルーム情報)のCRUD処理
  resource :bookings, only: [:new, :create] do #bookings(予約情報)のCRUD処理
    collection do
      post :confirm 
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end