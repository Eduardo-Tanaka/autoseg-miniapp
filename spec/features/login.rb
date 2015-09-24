require "rails_helper"

describe "UserSignin" do

  it "should allow a registered user to sign in" do
    visit new_user_session_path
    fill_in "Email", :with => "teste@teste.com"
    fill_in "Password", :with => "12341234"
    click_button "Logar"
    expect(page).to have_content("Tarefas")
  end

  it "should not allow an unregistered user to sign in" do
    visit new_user_session_path
    fill_in "Email", :with => "notarealuser@example.com"
    fill_in "Password", :with => "fakepassword"
    click_button "Logar"
    expect(page).to_not have_content("Tarefas")
  end
end
