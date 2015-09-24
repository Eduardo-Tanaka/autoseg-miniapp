require "rails_helper"

describe "UserSignUp" do

  it "should allow a user to sign up" do
    visit "users/sign_up"
    fill_in "Email", :with => "teste@teste.com"
    fill_in "user_password", :with => "12341234"
    fill_in "user_password_confirmation", :with => "12341234"

    click_button "Registrar"
    expect(page).to have_content("Tarefas")
  end

end
