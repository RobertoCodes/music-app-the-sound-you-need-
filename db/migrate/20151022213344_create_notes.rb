class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :user_id, presence: true
      t.integer :track_id, presence: true
      t.text :comment, presence: true
    end
    add_index :notes, :user_id
    add_index :notes, :track_id
  end
end
