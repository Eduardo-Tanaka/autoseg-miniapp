require 'rails_helper'

RSpec.describe SubItem, type: :model do
  before(:each) do
    @subItem = SubItem.new
  end

  it "is invalid without description" do
    expect(@subItem).to_not be_valid
  end

  it "is valid" do
    @subItem.description = "descrição"
    @subItem.item = Item.new
    expect(@subItem).to be_valid
  end
end
