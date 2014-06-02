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

    scenario "user login unsuccessfully" do
      visit "users/sign_in"

      fill_in "Email", with: ""
      fill_in "Senha", with: ""

      click_button "Logar"
      page.should have_text "E-mail ou senha inválidos."
      current_path.should == "/users/sign_in"
    end
  end

  feature "#edit account" do

    before(:each) do
      login_as user
    end

    scenario "user edits account successfully" do
      visit "users/edit"

      fill_in "Primeiro Nome", with: "Jose"
      fill_in "Último Nome", with: "Fulano"
      fill_in "Current password", with: user.password
      click_button "Atualizar"

      page.should have_text "Sua conta foi atualizada com sucesso."
      current_path.should == "/"
    end

    scenario "user edits account unsuccessfully" do
      visit "users/edit"

      fill_in "Primeiro Nome", with: ""
      fill_in "Último Nome", with: ""
      fill_in "Current password", with: ""
      click_button "Atualizar"

      page.should have_text "Alguns erros foram encontrados, por favor verifique:"
      current_path.should == "/users" 
    end
  end

  feature "#delete account" do
    
    before(:each) do
      login_as user
    end

    scenario "user deletes account", js: true do
      visit "/users/edit"

      click_link "Cancele minha conta"
      page.driver.browser.switch_to.alert.accept
      current_path.should == "/"
    end
  end

  feature "#search" do
    let(:user_B) { FactoryGirl.create(:user, first_name: "Jose", last_name: "Pereira", email: "pereira@exemplo.com", password: "11111111", password_confirmation: "11111111") }

    before(:each) do
      login_as user
      user_B.methodologies.create(title: "Aprenda Ruby", teaser: "resumo", content: "Conteúdo")
    end

    scenario "user search for methodology", js: true do
      visit "/users/my_profile"
      fill_in 'search', with: "Ruby"
      click_button "Search"

      page.should have_text "Aprenda Ruby"
      page.should have_text "Jose Pereira"
      current_path.should == "/users/my_profile"
    end

    scenario "user search for user", js: true do
      visit "/users/my_profile"
      fill_in 'search', with: "Jose"
      click_button "Search"

      page.should have_text "Aprenda Ruby"
      page.should have_text "Jose Pereira"
      current_path.should == "/users/my_profile"
    end
  end

  feature "#add friend" do
    let(:user_B) { FactoryGirl.create(:user, first_name: "Jose", last_name: "Pereira", email: "pereira@exemplo.com", password: "11111111", password_confirmation: "11111111") }

    before(:each) do
      login_as user
    end

    scenario "user adds a friend" do
      visit "/users/profile/#{user_B.id}"
      click_link "Adicionar amigo"

      page.should have_text "Convite enviado para o professor."
      click_link "Sair"

      visit "/users/sign_in"
      fill_in "Email", with: "pereira@exemplo.com"
      fill_in "Senha", with: "11111111"
      click_button "Logar"

      page.should have_text "Hugo adicionou você como amigo, deseja aceitar?"
      click_link "Aceitar"
      page.should have_text "Amigo aceito com sucesso."
      user_B.friendships.last.friend.full_name.should == "Hugo Tamaki"
      user.friendships.last.friend.full_name.should == "Jose Pereira"
    end

  end
end