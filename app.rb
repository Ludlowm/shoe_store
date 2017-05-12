require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get "/" do
  erb :index
end

get("/brands") do
  @brands = Brand.all()
  erb(:brands)
end

get("/stores") do
  @stores = Store.all()
  erb(:stores)
end

post("/brands") do
  name = params.fetch("brand_name")
  price = params["price"].to_i
  @brand = Brand.create({:name => name, price: price})
  redirect("/brands")
end

post("/stores") do
  name = params.fetch("store_name")
  Store.create({:name => name})
  redirect("/stores")
end

get("/brands/:id") do
  @brand = Brand.find(params.fetch("id").to_i())
  @brand_stores = @brand.stores
  @unassigned_stores = Store.includes(:brands).where(:brands_stores => {:brand_id => nil})
  erb(:brand)
end

get("/stores/:id") do
  @store = Store.find(params.fetch("id").to_i())
  @store_brands = @store.brands
  @unassigned_brands = Brand.includes(:stores).where(:brands_stores => {:store_id => nil})
  erb(:store)
end

patch("/brands/:id") do
  @brand = Brand.find(params.fetch("id").to_i())
  stores_to_add = params.fetch('stores_to_add',[])
  stores_to_delete = params.fetch('stores_to_delete',[])
  stores_to_add.each do |id|
    @brand.stores.push(Store.find(id))
  end
  stores_to_delete.each do |id|
    @brand.stores.destroy(Store.find(id))
  end
  redirect back
end

patch("/stores/:id") do
  @store = Store.find(params.fetch("id").to_i())
  brands_to_add = params.fetch('brands_to_add', [])
  brands_to_delete = params.fetch('brands_to_delete', [])
  brands_to_add.each do |id|
    @store.brands.push(Brand.find(id))
  end
  brands_to_delete.each do |id|
    @store.brands.destroy(Brand.find(id))
  end
  redirect back
end
