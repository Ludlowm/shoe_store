class CreateShoes < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoes) do |t|
      t.column(:name, :string)
      t.column(:description, :string)

      t.timestamps()
    end
  end
end
