ThinkingSphinx::Index.define :tweet, :with => :active_record do
  # fields
  indexes title, :sortable => true
  indexes content

  # attributes
  has :id, :as => :tweet_id
  has :category_id
  has created_at, updated_at
end