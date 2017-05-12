class BrandsShoes < ActiveRecord::Migration[5.1]
  def change
    create_table(:brands_shoes) do |t|
      t.column(:brand_id, :integer)
      t.column(:shoe_id, :integer)

      t.timestamps()
    end
  end
end
