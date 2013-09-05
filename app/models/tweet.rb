class Tweet < ActiveRecord::Base
  attr_accessible :content, :title, :category_id
  belongs_to :category
end
