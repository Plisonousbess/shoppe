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

    subject { get :new }
    it "renders the form" do
      expect(subject).to render_template(:new)
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


    subject {post :create, {"product" => {name: "", description: "", price: 12.12}}}
    it "renders the template" do
      expect(subject).to render_template(:new)
    end
  end

  # subject { patch :update,:id => prod.id, :product => {:name => "", :description => "", :price => 15} }
  #   it "renders the edit form if save or authentication fails" do
  #     expect(subject).to render_template(:edit, :id => prod.id)
  #   end


  describe 'GET #show' do
    it "shows a single product" do
      new_prod = Product.create({name: "sasasa", description: "asasasasa", price: 12.12 })
      get :show, :id => new_prod.id
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #edit' do
    let(:new_prod) { Product.create({name: "sasasa", description: "asasasasa", price: 12.12 })}
    it "shows a single product's edit form" do
      get :edit, :id => new_prod.id
      expect(response.status).to eq(200)
    end

    subject { get :edit, :id => new_prod.id }
    it "renders the edit form" do
      expect(subject).to render_template(:edit, :id => new_prod.id)
    end
  end


  describe 'PATCH #edit' do
    let(:prod) { Product.create({name: "banana", description: "trees of banana", price: 100.20 }) }
    subject { patch :update,:id => prod.id, :product => {:name => "", :description => "", :price => 15} }
    it "renders the edit form if save or authentication fails" do
      expect(subject).to render_template(:edit, :id => prod.id)
    end
    it "responds with a 302" do
      patch :update,:id => prod.id, :product => {:name => "apple", :description => "plants", :price => 15}
      expect(response.status).to eq 302
    end
  end

  describe 'DELETE #destroy' do
    prod = Product.create({name: "banana", description: "trees of banana", price: 100.20 })

    it "should change resulting product count by -1" do
      expect{ post :destroy, :id => prod.id }.to change{ Product.count }.by(-1)
    end
  end
end

