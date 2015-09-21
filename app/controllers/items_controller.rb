class ItemsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_item, except: [:destroy]
  after_action :save, except: [:destroy]

  def complete
    @item.completed = true
    redirect_to user_list_path(params[:user_id], params[:list_id]), notice: "Lista Atualizada!"
  end

  def uncomplete
    @item.completed = false
    redirect_to user_list_url(params[:user_id], params[:list_id]), notice: "Lista Atualizada!"
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to :back, notice: "Tarefa Deletada"
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def save
    @item.save
  end
end
