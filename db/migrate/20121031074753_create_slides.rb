class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.string :url
      t.string :image

      t.timestamps
    end
  end
end
