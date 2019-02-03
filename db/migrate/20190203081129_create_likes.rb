class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :user,     foreign_ky: true
      t.references :product,  foreign_ky: true
      t.timestamps
    end
  end
end
