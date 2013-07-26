class Attachment < ActiveRecord::Base
	# attr_accessible :title, :body
	attr_accessible :file
	has_attached_file :file, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
