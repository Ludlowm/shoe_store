class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates :name, presence: true
  validates(:name, {:presence => true, :length => { :maximum => 100 }})
  validates_uniqueness_of   :name
  before_save(:capitalize_letter)

private

  define_method(:capitalize_letter) do
    self.name=(name().split.map(&:capitalize).join(' '))
  end

  # define_method(:price_to_currency) do
  #   self.price=(price).to_s.concat("$")
  # end
end
