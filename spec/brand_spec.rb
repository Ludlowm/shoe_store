require "spec_helper"

describe(Brand) do
  it("can have a store") do
    test_brand1 = Brand.new(name: "Nike")
    test_store = test_brand1.stores.new(name: "Walmart")
    expect(test_brand1.stores()).to(eq([test_store]))
  end

  it("can have multiple stores") do
    test_brand1 = Brand.new(name: "Nike")
    test_store1 = test_brand1.stores.new(name: "Walmart")
    test_store2 = test_brand1.stores.new(name: "Target")
    expect(test_brand1.stores()).to(eq([test_store1,test_store2]))
  end

  it("validates presence of brand name") do
    test_brand = Store.new({:name => ""})
    expect(test_brand.save()).to(eq(false))
  end

  it("ensures the length of brand name is at most 20 characters") do
    test_brand = Brand.new({:name => "a".*(21)})
    expect(test_brand.save()).to(eq(false))
  end

  it("converts the first letter of name to uppercase") do
    test_brand = Brand.create({:name => "bob the builder"})
    expect(test_brand.name()).to(eq("Bob The Builder"))
  end

  it("converts the price to add a dollar sign to it always") do
    test_price = Brand.create({:price => 200})
    expect(test_price.price()).to(eq("200$"))
  end
end
