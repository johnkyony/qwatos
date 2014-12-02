class CreateQwatos < ActiveRecord::Migration
  def change
    create_table :qwatos do |t|
      t.text :quote
      t.string :image_url
      t.datetime :uploaded_at
      t.references :user, index: true

      t.timestamps
    end
  end
end
