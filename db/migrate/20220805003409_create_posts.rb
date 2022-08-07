class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :member_id, null: false
      t.string :subject, null: false
      t.text :text, null: false
      t.string :check_count
      t.datetime :limit, null: false
      t.boolean :browse_status, null: false, default: true
      t.timestamps
    end
  end
end
