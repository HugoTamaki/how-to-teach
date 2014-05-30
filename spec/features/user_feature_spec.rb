#encoding: UTF-8
require 'spec_helper'

feature "User" do
  let(:user) { FactoryGirl.create :user }

  feature "#create account" do
    scenario "user creates account successfuly" do
      visit "users/sign_up"

      fill_in "Primeiro Nome", with: "Hugo"
      fill_in "Último Nome", with: "Tamaki"
      fill_in "Nome da Escola", with: "Escola lerolero"
      fill_in "Email", with: "hugotamaki@exemplo.com"
      fill_in "user_password", with: "12345678", exact: true
      fill_in "Confirmação da Senha", with: "12345678"

      click_button "Cadastrar"

      page.should have_text "Login efetuado com sucesso. Se não foi autorizado, a confirmação será enviada por e-mail."
      page.should have_text "Hugo Tamaki"
      page.should have_text "Escola lerolero"
      page.should have_text "Logado como hugotamaki@exemplo.com."
      current_path.should == "/users/my_profile"
    end

    scenario "user creates account without success" do
      visit "users/sign_up"

      fill_in "Primeiro Nome", with: ""
      fill_in "Último Nome", with: ""
      fill_in "Email", with: ""
      fill_in "user_password", with: ""
      fill_in "Confirmação da Senha", with: ""

      click_button "Cadastrar"

      page.should have_text "Alguns erros foram encontrados, por favor verifique:"
      current_path.should == "/users"
    end
  end

  feature "#login" do

    scenario "user login successfully" do
      visit "users/sign_in"    

      fill_in "Email", with: user.email
      fill_in "Senha", with: user.password

      click_button "Logar"
      page.should have_text "Login efetuado com sucesso!"
      page.should have_text "Logado como #{user.email}"
      current_path.should == "/users/my_profile"
    end
  end
end