class CreateTask < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :nome
      t.integer :project_id
      t.integer :status_id
      t.text :descricao
      t.string :commit_hash
      t.timestamps
    end
  end
end
