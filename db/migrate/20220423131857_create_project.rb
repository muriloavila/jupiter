class CreateProject < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :nome
      t.integer :status_id
      t.text :descricao
      t.string :github_url
      t.timestamps
    end
  end
end
