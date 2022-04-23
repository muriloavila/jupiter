class CreateStatus < ActiveRecord::Migration[6.1]
  def change
    create_table :status do |t|
      t.string :nome_status
      t.timestamps
    end
  end
end
