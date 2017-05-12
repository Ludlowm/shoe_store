require "spec_helper"

describe(Store) do
  it("can have an brand") do
    test_store = Store.new(name: "Walmart")
    test_brand = test_store.brands.new(name: "Nike")
    expect(test_store.brands()).to(eq([test_brand]))
  end

  it("can have multiple brands") do
    test_store = Store.new(name: "Walmart")
    test_brand1 = test_store.brands.new(name: "Nike")
    test_brand2 = test_store.brands.new(name: "Adidas")
    expect(test_store.brands()).to(eq([test_brand1,test_brand2]))
  end

  it("validates presence of store name") do
    test_store = Store.new({:name => ""})
    expect(test_store.save()).to(eq(false))
  end

  it("ensures the length of store name is at most 100 characters") do
    test_store = Store.new({:name => "a".*(101)})
    expect(test_store.save()).to(eq(false))
  end

  it("converts the first letter of name to uppercase") do
    test_store = Store.create({:name => "bob the builder"})
    expect(test_store.name()).to(eq("Bob The Builder"))
  end
end
