class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :member_id, null: false
      t.string :subject, null: false
      t.text :text, null: false
      t.string :check_count
      t.date :limit
      t.integer :browse_status, null: false, default: 0
      t.timestamps
    end
  end
end
