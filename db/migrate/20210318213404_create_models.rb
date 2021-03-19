class CreateModels < ActiveRecord::Migration[6.1]
  def change
    create_table :models do |t|
      t.column(:name, :string)
      t.column(:year, :integer)
      t.column(:price, :integer)
      t.column(:miles, :integer)
      t.column(:brand_id, :integer)
      t.timestamps
    end
  end
end
