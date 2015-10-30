Rails.application.routes.draw do
  # No es necesario implementar las rutas.
  root to: 'index#home'
  resources :visits, only: [:new, :create]
end
