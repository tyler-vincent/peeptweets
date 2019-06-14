class CreateBrandScores < ActiveRecord::Migration[5.2]
  def change
    create_table :brand_scores do |t|
      t.string :term
      t.decimal :score, precision: 3, scale: 2

      t.timestamps
    end
  end
end
