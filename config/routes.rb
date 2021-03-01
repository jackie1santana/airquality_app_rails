Rails.application.routes.draw do
root 'current#index'

get '/history', to: 'history#index'

get '/forecast', to: 'forecast#index'

end
