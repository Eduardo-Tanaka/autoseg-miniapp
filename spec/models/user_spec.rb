require 'rails_helper'

describe User do

  before(:each) do
    @user = User.new
  end

  it "is invalid without email" do
    @user.password = "12341234"
    expect(@user).to_not be_valid
  end

  it "is invalid without password" do
    @user.email = "teste@teste.com"
    expect(@user).to_not be_valid
  end

  it "is invalid with password length < 8 characters" do
    @user.email = "teste@teste.com"
    @user.password = "1234"
    expect(@user).to_not be_valid
  end

  it "is valid" do
    @user.email = "teste@teste.com"
    @user.password = "12341234"
    @user.save
    expect(@user).to be_valid
  end
end
