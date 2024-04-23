class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :creator
      t.string :store_url
      t.string :tracking_code
      t.integer :visit

      t.timestamps
    end
  end
end
