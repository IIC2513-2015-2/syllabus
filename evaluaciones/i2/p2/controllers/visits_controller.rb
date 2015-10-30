# Visits controller
class VisitsController < ApplicationController
  # No es necesario implementar esta acción.
  def new
    @visit = Visit.new
  end

  def create
    @visit = Visit.create(visit_params)
    if @visit.persisted?
      session[:is_spy] = SpyDetector.process(params[:answer])
      redirect_to root_path and return
    end
    render :new
  end

  def visit_params
    params.require(:visit).permit(:name, :birth, :country)
  end
end
