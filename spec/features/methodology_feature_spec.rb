#encoding: UTF-8
require 'spec_helper'

feature "Methodology" do
  let(:user) { FactoryGirl.create :user }

  feature "#create methodology" do

    before(:each) do
      login_as user
    end

    scenario "user creates new methodology successfully" do
      visit "/methodologies/new"

      fill_in "Titulo", with: "Metodologia"
      fill_in "Teaser", with: "Teaser"
      fill_in "Conteúdo", with: "Conteudo"
      click_button "GO"

      page.should have_text("Metodologia criada com sucesso.")
      page.should have_text("Metodologia")
      current_path.should == "/users/my_profile"
    end

    scenario "user creates new methodology with failure" do
      visit "/methodologies/new"

      fill_in "Titulo", with: "Methodologia"
      fill_in "Teaser", with: ""
      fill_in "Conteúdo", with: ""
      click_button "GO"

      page.should have_text("não pode ficar em branco")
      current_path.should == "/methodologies"
    end
  end

  feature "#edit methodology" do

    before(:each) do
      login_as user
      user.methodologies.create(title: "Titulo", teaser: "Resumo", content: "Conteúdo")
    end

    scenario "user edit methodology with success" do
      visit "/methodologies/#{Methodology.last.id}/edit"
      fill_in "Titulo", with: "Titulo 2"
      fill_in "Teaser", with: "Teaser 2"
      fill_in "Conteúdo", with: "Conteudo 2"
      click_button "GO"

      page.should have_text("Titulo 2")
      current_path.should == "/methodologies/#{Methodology.last.id}"
    end

    scenario "user edit methodology with failure" do
      visit "/methodologies/#{Methodology.last.id}/edit"
      fill_in "Titulo", with: ""
      fill_in "Teaser", with: ""
      fill_in "Conteúdo", with: ""
      click_button "GO"

      page.should have_text("não pode ficar em branco")
      current_path.should == "/methodologies/#{Methodology.last.id}"
    end
  end

  feature "#delete methodology" do

    before(:each) do
      login_as user
      user.methodologies.create(title: "Titulo", teaser: "Resumo", content: "Conteúdo")
    end

    scenario "user delete methodology", js: true do
      visit "/users/my_profile"
      click_link "Remover"
      page.driver.browser.switch_to.alert.accept

      page.should have_text("Metodologia apagada com sucesso.")
      current_path.should == "/users/my_profile"
    end
  end

  feature "#comment methodology" do
    
    before(:each) do
      login_as user
      user.methodologies.create(title: "Titulo", teaser: "Resumo", content: "Conteudo")
    end

    scenario "user comments methodology" do
      visit "/methodologies/#{Methodology.last.id}"

      fill_in "Novo comentário", with: "Essa metodologia é muito boa"
      click_button "Criar comentário"

      page.should have_text "Essa metodologia é muito boa"
      current_path.should == "/methodologies/#{Methodology.last.id}"
    end
  end

  feature "#rate methodology", js: true do
    
    before(:each) do
      login_as user
      user.methodologies.create(title: "Titulo", teaser: "Resumo", content: "Conteudo")
    end

    scenario "user rates methodology" do
      visit "/methodologies/#{Methodology.last.id}"

      find("img[alt='5']").click
      last_methodology = Methodology.last
      methodology_last_rate = last_methodology.qualidade_rates.last
      methodology_last_rate.stars.should be_equal(5.0)
    end
  end
end