require 'rails_helper'

describe User do
  it "is invalid without email" do
    user = User.new
    user.password = "12341234"
    expect(user).to_not be_valid
  end

  it "is invalid without password" do
    user = User.new
    user.email = "teste@teste.com"
    expect(user).to_not be_valid
  end

  it "is invalid with password length < 8 characters" do
    user = User.new
    user.email = "teste@teste.com"
    user.password = "1234"
    expect(user).to_not be_valid
  end

  it "is valid" do
    user = User.new
    user.email = "teste@teste.com"
    user.password = "12341234"
    user.save
    expect(user).to be_valid
  end
end
