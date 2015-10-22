require 'capybara'

describe "Product", :js => true do
  let(:product) {
    Product.create(
    name: Faker::Commerce.product_name,
    description:  Faker::Lorem.sentence(3),
    price: Faker::Commerce.price,
    url: Faker::Avatar.image)
}

  it "shows the product" do
    visit root_path
    expect(page).to have_content(product.name)
  end

end
