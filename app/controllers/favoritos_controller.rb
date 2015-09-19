class FavoritosController < ApplicationController

  before_action :authenticate_user!
  before_action :find_user

  def add_favorito
    favorito = Favorito.create(params.permit(:user_id, :list_id))
    redirect_to user_favoritos_path(@user), notice: "Lista Adicionada aos Favoritos!"
  end

  def remove_favorito
    favorito = Favorito.find(params[:favorito_id])
    favorito.destroy
    redirect_to user_favoritos_path(@user), notice: "Lista Removida dos Favoritos!"
  end

  def favoritos
    @lists = List.joins(:favoritos).where("favoritos.user_id = ?", current_user.id)
  end

  def find_user
    @user = User.find(current_user.id) if current_user != nil
  end
end