require "spec_helper"

require "spec_helper"

describe(Store) do
  it("can have an brand") do
    test_store = Store.new(name: "Pasta with tomato")
    test_brand = test_store.brands.new(name: "Tomato")
    expect(test_store.brands()).to(eq([test_brand]))
  end

  it("can have multiple brands") do
    test_store = Store.new(name: "Tomato")
    test_brand1 = test_store.brands.new(name: "Tomato")
    test_brand2 = test_store.brands.new(name: "Chicken")
    expect(test_store.brands()).to(eq([test_brand1,test_brand2]))
  end

  it("validates presence of store name") do
    test_store = Store.new({:name => ""})
    expect(test_store.save()).to(eq(false))
  end

  it("ensures the length of store name is at most 20 characters") do
    test_store = Store.new({:name => "a".*(21)})
    expect(test_store.save()).to(eq(false))
  end

  it("converts the first letter of name to uppercase") do
    test_store = Store.create({:name => "bob the builder"})
    expect(test_store.name()).to(eq("Bob The Builder"))
  end
end
