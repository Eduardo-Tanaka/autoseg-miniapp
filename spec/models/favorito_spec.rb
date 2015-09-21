require "rails_helper"

describe Favorito do

  before(:each) do
    @favorito = Favorito.new
  end

  it "is invalid without list" do
    @favorito.user = User.new
    expect(@favorito).to_not be_valid
  end

  it "is invalid without user" do
    @favorito.list = List.new
    expect(@favorito).to_not be_valid
  end

  it "is valid" do
    @favorito.list = List.new
    @favorito.user = User.new
    expect(@favorito).to be_valid
  end
end
