require "rails_helper"

describe Item do
  it "is invalid without description" do
    item = Item.new
    expect(item).to_not be_valid
  end

  it "is invalid without list" do
    item = Item.new
    item.description = "descrição"
    expect(item).to_not be_valid
  end

  it "is valid" do
    item = Item.new
    item.description = "descrição"
    item.list = List.new
    expect(item).to be_valid
  end
end
