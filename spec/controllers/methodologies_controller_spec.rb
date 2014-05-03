#encoding: UTF-8
require 'spec_helper'

describe MethodologiesController do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    for i in (1..4)
      user.methodologies.build(title: 'titulo #{i}', content: 'conteudo')
    end
    user.save
  end

  describe 'GET #show' do
    let(:methodology) { user.methodologies.last }

    it 'gets users methodology' do
      get :show, id: methodology
      assigns(:methodology).should == methodology
    end

    it 'renders the :show view' do
      
    end
  end
end