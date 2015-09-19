class ItemsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_item, except: [:destroy]
  after_action :save, except: [:destroy]

  def complete
    @item.completed = true
    redirect_to user_list_path(params[:user_id], params[:list_id])
  end

  def uncomplete
    @item.completed = false
    redirect_to user_list_url(params[:user_id], params[:list_id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to edit_user_list_path(params[:user_id], params[:list_id])
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def save
    @item.save
  end
end
