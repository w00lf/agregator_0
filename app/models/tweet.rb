class Tweet < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :category
end
