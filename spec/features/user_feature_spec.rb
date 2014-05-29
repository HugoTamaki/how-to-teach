require 'spec_helper'

feature "User" do
  let(:user) { FactoryGirl.create(user) }

  feature "#management" do
    scenario "user creates account successfuly" do
      visit "users/sign_up"

      fill_in "Primeiro Nome", with: "Hugo"
      fill_in "Último Nome", with: "Tamaki"
      fill_in "Nome da Escola", with: "Escola lerolero"
      fill_in "Email", with: "hugotamaki@exemplo.com"
      fill_in "user_password", with: "12345678", exact: true
      fill_in "Confirmação da Senha", with: "12345678"

      click_button "Cadastrar"

      expect(page).to have_text("Login efetuado com sucesso. Se não foi autorizado, a confirmação será enviada por e-mail.")
      expect(page).to have_text("Hugo Tamaki")
      expect(page).to have_text("Escola lerolero")
      expect(page).to have_text("Logado como hugotamaki@exemplo.com.")
      current_path.should == "/users/my_profile"
    end

    scenario "user creates account without success" do
      
    end
  end
end