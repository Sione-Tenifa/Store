class StoresController < ApplicationController
  before_action :set_store, only: [:show, :update, :edit, :destroy]
  
  def index
    @stores = Store.all
  end

  def show
  end

  def new
    @store = Store.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @store = Store.new(store_params)

    if @store.save
      redirect_to store_path
    else
      render :new
    end
  end

  def destroy
    @store.destroy
    redirect_to stores_path(@store)
  end

  private

    def set_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit(:name)
    end

end
