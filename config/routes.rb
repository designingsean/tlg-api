Rails.application.routes.draw do
  resources :users do
    collection do
      get :inactive
    end
  end

  resources :clock do
    collection do
      post :range
    end
  end

  resources :calls do
    collection do
      get :complete
    end
  end

  resources :notes do
    collection do
    end
  end
end
