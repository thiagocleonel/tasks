class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :delivery
      t.integer :status,default:1
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
