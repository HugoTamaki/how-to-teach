#encoding: UTF-8
require 'spec_helper'

feature "Methodology", js: true do
  before :each do
    login
    create_methodology
  end

  feature "#management" do
    scenario "user creates new methodology successfully" do
      visit "/methodologies/new"

      fill_in "Titulo", with: "Metodologia"
      fill_in "Conteúdo", with: "Conteudo"
      click_button "GO"

      expect(page).to have_text("Metodologia criada com sucesso.")
      expect(page).to have_text("Metodologia")
      current_path.should == "/users/my_profile"
    end

    scenario "user creates new methodology with failure" do
      visit "/methodologies/new"

      fill_in "Titulo", with: "Methodologia"
      fill_in "Conteúdo", with: ""
      click_button "GO"

      expect(page).to have_text("não pode ficar em branco")
      current_path.should == "/methodologies"
    end

    scenario "user edit methodology with success" do
      visit "/methodologies/#{Methodology.last.id}/edit"
      fill_in "Titulo", with: "Titulo 2"
      fill_in "Conteúdo", with: "Conteudo 2"
      click_button "GO"

      expect(page).to have_text("Titulo 2")
      current_path.should == "/methodologies/#{Methodology.last.id}"
    end

    scenario "user edit methodology with failure" do
      visit "/methodologies/#{Methodology.last.id}/edit"
      fill_in "Titulo", with: ""
      fill_in "Conteúdo", with: ""
      click_button "GO"

      expect(page).to have_text("não pode ficar em branco")
      current_path.should == "/methodologies/#{Methodology.last.id}"
    end

    scenario "user delete methodology" do
      visit "/users/my_profile"
      click_link "Remover"
      page.driver.browser.switch_to.alert.accept

      expect(page).to have_text("Metodologia apagada com sucesso.")
      current_path.should == "/users/my_profile"
    end
  end

  def login
    user = FactoryGirl.create(:user)
    visit "/users/sign_in"

    fill_in "Email", with: user.email
    fill_in "Senha", with: '11111111'

    click_button "Logar"
  end

  def create_methodology
    user = User.first
    user.methodologies.build(title: "Titulo", content: "Conteudo")
    user.save
  end
end