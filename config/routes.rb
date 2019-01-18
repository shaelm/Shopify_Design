Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :products do

        collection do
          get 'avail'
          put 'purchase/:id', to: 'products#purchase'
        end
       end
      end
  end
end






