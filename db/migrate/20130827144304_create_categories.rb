class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      	t.string :title
      	t.timestamps
    end
    create_table :category_rel do |t|
    	t.integer :parent_category_id
      	t.integer :sub_category_id
    end
    add_column :tweets, :category_id, :integer
  end
end
