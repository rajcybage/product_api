module Product
  class Data < Grape::API

    resource :products do
      desc "List all Product"

      get do
        ProductList.select(:name, :sku_id, :description, :price, :id)
      end

      desc "create a new product"
       ## This takes care of parameter validation
      params do
        requires :name, type: String
        requires :sku_id, type: String
        requires :description, type: String
        requires :price, type: BigDecimal
        optional :expire_date, type: String
        optional :images, type: Array do
          optional "", type: Hash do
            optional :img_path, type: String
          end
        end
         optional :vars, type: Hash do
           requires :color, type: String
           requires :models, type: Array[String]
         end
        optional :categories, type: Array[String]
        optional :tags, type: Array[String]
      end

      ## This takes care of creating product
      post do
        ProductList.create!({
          name: params[:name],
          sku_id: params[:sku_id],
          description: params[:description],
          price: params[:price],
          vars: params[:vars],
          categories: params[:categories],
          tags: params[:tags],
          images: params[:images],
          expire_date: params[:expire_date]
        })
      end

      desc "delete an product"
      params do
        requires :id, type: String
      end

      delete ':id' do
        ProductList.find(params[:id]).destroy!
      end

      desc "show an product"
      params do
        requires :id, type: String
      end

      get ':id' do
         ProductList.find(params[:id])
      end
    end
  end
end
