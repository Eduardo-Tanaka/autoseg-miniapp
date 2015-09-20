require "rails_helper"

describe List do
  it "is invalid without title" do
    list = List.new
    list.description = "descrição"
    expect(list).to_not be_valid
  end

  it "is invalid without description" do
    list = List.new
    list.title = "titulo"
    expect(list).to_not be_valid
  end

  it "is invalid without user" do
    list = List.new
    list.title = "titulo"
    list.description = "descrição"
    expect(list).to_not be_valid
  end

  it "is valid" do
    list = List.new
    list.title = "titulo"
    list.description = "descrição"
    list.user = User.new
    expect(list).to be_valid
  end
end
