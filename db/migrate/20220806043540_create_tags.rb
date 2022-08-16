class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :tag_name, null: false
      t.string :tag_status, null: false, default:0
      t.timestamps
    end
  end
end
