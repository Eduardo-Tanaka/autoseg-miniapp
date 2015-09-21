class SubItemsController < ApplicationController

  before_action :authenticate_user!

  def destroy
    sub_item = SubItem.find(params[:id])
    sub_item.destroy
    redirect_to :back, notice: "Sub Tarefa Deletada"
  end

end
