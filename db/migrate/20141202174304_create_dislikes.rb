class CreateDislikes < ActiveRecord::Migration
  def change
    create_table :dislikes do |t|
      t.references :user, index: true
      t.references :qwato, index: true

      t.timestamps
    end
  end
end
