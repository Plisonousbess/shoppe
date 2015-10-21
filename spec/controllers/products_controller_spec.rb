require 'rails_helper'
require 'spec_helper'

RSpec.describe ProductsController, type: :controller do
  # before(:each) do
  #   let product = Product.create(name: "banana", description: "trees of banana", price: 100.20 )
  # end

  describe "get #index" do

    before(:each) do
      get :index
    end
    it "responds with a 200" do
      expect(response.status).to eq 200
    end

    it "assigns the @products instance variable" do
      expect(assigns(:products)).to be_a(ActiveRecord::Relation)
    end
  end

  describe 'GET #new' do
    it "responds with a 200" do
      get :new
      expect(response.status).to eq 200
    end
  end

  describe 'POST #create' do
    it "saves a new product in the database" do
      expect{ post :create, { "product" => {name: "sasasa", description: "asasasasa", price: 12.12 }}}.to change{ Product.count }.by(1)
    end
    it "redirects to the root path" do
      post :create, {"product" => {name: "sasasa", description: "asasasasa", price: 12.12}}
      expect(response.status).to eq(302)
    end
    it "does not save an empty product to the database" do
      expect{ post :create, { "product" => {name: "", description: "", price: -1}}}.to change{ Product.count }.by(0)
    end

  end

  # describe 'put #update' do
  #   product = Product.create(name: "banana", description: "trees of banana", price: 100.20 )
  #   prod = Product.find_by(name: 'banana')
  #   prod.name = 'apple'

  #   it "responds with a 302" do
  #   patch :update, prod
  #     expect(response.status).to eq 302
  #   end

  # end

end
