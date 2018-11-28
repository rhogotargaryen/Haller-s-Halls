class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :user_id
      t.string :description
      t.integer :comment_id
      t.string :date_sold

      t.timestamps
    end
  end
end
