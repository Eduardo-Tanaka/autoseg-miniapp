require "rails_helper"

describe List do

  before(:each) do
    @list = List.new
  end

  it "is invalid without title" do
    @list.description = "descrição"
    expect(@list).to_not be_valid
  end

  it "is invalid without description" do
    @list.title = "titulo"
    expect(@list).to_not be_valid
  end

  it "is invalid without user" do
    @list.title = "titulo"
    @list.description = "descrição"
    expect(@list).to_not be_valid
  end

  it "is valid" do
    @list.title = "titulo"
    @list.description = "descrição"
    @list.user = User.new
    expect(@list).to be_valid
  end
end
