describe "Product::Data" do
  def valid_attributes
    {
      "name" => "Product1", "sku_id" => "12332", 
      "vars" => {"color"=> "black", "models" => ["914","924"]}, 
      "categories" => ["aa", "bb"], 
      "tags" => ["a", "b"], "description" => "test product", 
      "price" => 12,
      "images" => [{"img_path" => "http://xml.com/pop.jpg"}, {"img_path" => "http://xml222.com/pop.jpg"}]
    }
  end

  before do
    ProductList.destroy_all
  end

  context 'GET /api/v1/products.json' do
    it 'returns an empty array of statuses' do
      get '/api/v1/products.json'
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq []
    end
  end

  context 'POST /api/v1/products.json' do
    it "create product" do
      post '/api/v1/products.json', valid_attributes.to_json, {'ACCEPT' => "application/json", 'CONTENT_TYPE' => 'application/json'}
      expect(response.status).to eq(201)
      expect(ProductList.count).to eq(1)
      expect(ProductList.last.categories).to include("aa")
      expect(ProductList.last.vars["color"]).to eq("black")
      expect(ProductList.last.tags).to include("a")
      expect(ProductList.last.images.first["img_path"]).to eq("http://xml.com/pop.jpg")
      expect(ProductList.last.price).to eq(1200)
    end
  end

  context 'Show /api/v1/products/1.json' do
    it 'show the product' do
      product = create(:product_list)
      get '/api/v1/products/' + product.id.to_s
      expect(response.status).to eq(200)
      expect(ProductList.count).to eq(1)
    end
  end
end