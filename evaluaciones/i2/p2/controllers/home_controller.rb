# Home controller
class HomeController < ApplicationController
  def index
    # Implementar alguna manera de saber si ingreso como visita
    # Esto es distinto a saber si es spy o no.
    redirect_to new_visit_path unless session.key?(:is_spy)

    @spy = session[:is_spy]
    # Pass and render home/index (default action)
  end
end
