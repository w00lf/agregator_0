class Category < ActiveRecord::Base
   attr_accessible :sub_categories, :title, :parent_category_id
   has_and_belongs_to_many :sub_categories, 
   						class_name: "Category", 
   						join_table: "category_rel",
   						foreign_key: "parent_category_id", 
   						association_foreign_key: "sub_category_id"
   	has_many :tweets
end
