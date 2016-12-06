class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user, index: true, foreign_key: true
      t.string :path
      t.string :action
      t.integer :originator_id
      t.integer :reference_id
      t.boolean :viewed, default: false

      t.timestamps null: false
    end
  end
end
