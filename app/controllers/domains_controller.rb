class DomainsController < ApplicationController
  def index
    @domains = Domain.all
  end

  def new
    @domain = Domain.new
  end

  def create
    Domain.new(params[:domain]).save
    redirect_to action: :index and return
  end

  def destroy
    Domain.destroy(params[:id])
    redirect_to action: :index and return
  end
end
