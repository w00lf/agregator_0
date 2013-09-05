class @Agrigator.Collections.PaginatedCollection extends Backbone.Collection

	per_page: 5

	page_active: 1

	additional_params: {}


	fetch_w_params: (add, callback) ->
		if(!add) 
		  @page_active = 1

		params = 
			per_page: @per_page
			page: @page_active

		@fetch( 
			add: add
			data:  
				$.extend(params, @additional_params)
			success:
				callback
		)

	parse: (response) ->
		@total_entries = response.total_entries
		response.results