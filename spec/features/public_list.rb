require "rails_helper"

describe "the favorite process", :type => :feature do

  before :each do
    visit new_user_session_path
    fill_in "Email", :with => "teste@teste.com"
    fill_in "Password", :with => "12341234"
    click_button "Logar"
  end

  it "add favorite" do
    visit '/publica'
    click_on 'Adicionar'
    expect(page).to have_text("Adicionada")
  end

  it "remove favorite" do
    visit '/publica'
    click_on 'Remover'
    expect(page).to have_text("Removida")
  end
end
