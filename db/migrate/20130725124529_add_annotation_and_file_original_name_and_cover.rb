class AddAnnotationAndFileOriginalNameAndCover < ActiveRecord::Migration
	def change
		add_column :attachments, :annotation, :text
	end
end
