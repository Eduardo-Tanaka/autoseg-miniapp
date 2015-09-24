require "rails_helper"

describe "the create list process", :type => :feature do

  before :each do
    visit new_user_session_path
    fill_in "Email", :with => "teste@teste.com"
    fill_in "Password", :with => "12341234"
    click_button "Logar"
  end

  it "create a new list" do
    visit new_user_list_path(1)
    fill_in "Título", with: "titulo"
    fill_in "Descrição", with: "descricao"
    check "Público?"
    click_button "Salvar"
    expect(page).to have_text("Criada")
  end

  it "is invalid" do
    visit new_user_list_path(1)
    click_button "Salvar"
    expect(page).to have_text("Erro")
  end
end
