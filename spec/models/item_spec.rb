require "rails_helper"

describe Item do

  before(:each) do
    @item = Item.new
  end

  it "is invalid without description" do
    expect(@item).to_not be_valid
  end

  it "is valid" do
    @item.description = "descrição"
    @item.list = List.new
    expect(@item).to be_valid
  end
end
