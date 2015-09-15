class HomeController < ApplicationController
  before_action :find_user

  def index

  end

  def publica
    @lists = List.all.where(publico: true)
  end

  private

  def find_user
    @user = User.find(current_user.id) if current_user != nil
  end
end
