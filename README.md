== README


* Ruby version

2.2
* Rails Version

4.2.5

* Database

Postgresql > 9.3

** Gems

>> Grape gem to build api

>> Rspec for aceptance test
>> Rails admin for admin interface

How to do

```
1. bundle install
````

then

```
2. bundle exec rake db:setup

```

then 

```
3. bundle exec puma
```

IFor calling api

````
RestClient.post 'http://localhost:3000/api/v1/products.json', {"name" => "Product1", "sku_id" => "12332", "description" => "test product", "price" => 12, "expire_date" => "23", "categories" => ["a"], "tags" => ["aa"], "vars" => {"color" => "black", "models" => ["23", "24"]}, "images" => [{"img_path" => "http://"}, {"img_path" => "jkk"}]}.to_json, :content_type => :json, :accept => :json

```

For run test 

````
bundle exec rspec
````

In first page now you see admin section

you can  add edit destroy create it.
