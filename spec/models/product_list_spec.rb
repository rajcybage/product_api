require 'rails_helper'

RSpec.describe ProductList, type: :model do
  let(:err_product_list) {ProductList.new}
  let(:product) {create(:product_list)}

  it { expect(err_product_list).not_to be_valid }

  it "should check name should presence" do
    err_product_list.valid?
    expect(err_product_list.errors[:name]).to include("can't be blank")
  end

  it "should check sku id should presence" do
    err_product_list.valid?
    expect(err_product_list.errors[:sku_id]).to include("can't be blank")
  end

  it "should check price should presence" do
    err_product_list.valid?
    expect(err_product_list.errors[:price]).to include("can't be blank")
  end

  it "should check description should presence" do
    err_product_list.valid?
    expect(err_product_list.errors[:description]).to include("can't be blank")
  end

  it "should create product" do
    expect(product.name).to eq("test product")
  end

  it "should multiple 100 to price while create a product" do
    productn = create(:product_list, price: 11)
    expect(productn.price).to eq(1100)    
  end
end
