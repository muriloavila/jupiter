class CreatePost < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :task_id
      t.string :titulo
      t.text :texto
      t.timestamps
    end
  end
end
