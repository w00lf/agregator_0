class @Agrigator.Collections.PaginatedCollection extends Backbone.Collection
	query: ''

	per_page: 13

	page_active: 1

	order: ''

	reload: (callback) ->
		@fetch( 
			data:  
				order: @order
				query: @query
				per_page: @per_page
				page: 1
			success:
				callback
		)


	fetch_w_params: (reload, callback) ->
		if(reload) 
		  @page_active = 1
		@fetch( 
			add: true
			data:  
				order: @order
				query: @query
				per_page: @per_page
				page: @page_active
			success:
				callback
		)

	parse: (response) ->
		@total_entries = response.total_entries
		response.results