class ListsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_user
  before_action :find_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all.where("user_id = ?", current_user.id)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    @list.user_id = @user.id
    if @list.save
      redirect_to user_list_path(@user, @list), notice: "Lista Criada!"
    else
      render :back
    end
  end

  def show

  end

  def edit

  end

  def update
    if @list.update(list_params)
      redirect_to user_lists_path(@user, @list), notice: "Lista Atualizada!"
    else
      render 'edit'
    end
  end

  def destroy
    @list.destroy
    redirect_to user_lists_path(@user), notice: "Lista Deletada!"
  end

  private

  def list_params
    params.require(:list).permit(:titulo, :descricao, :publico)
  end

  def find_list
    @list = List.find(params[:id])
  end

  def find_user
    @user = User.find(current_user.id) if current_user != nil
  end
end
