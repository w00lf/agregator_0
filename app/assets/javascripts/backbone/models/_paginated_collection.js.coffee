class @Agrigator.Collections.PaginatedCollection extends Backbone.Collection
	query: ''

	per_page: 5

	page_active: 1

	order: ''

	additional_params: {}


	fetch_w_params: (reload, callback) ->
		if(reload) 
		  @page_active = 1

		params = 
			order: @order
			query: @query
			per_page: @per_page
			page: @page_active

		@fetch( 
			add: !reload
			data:  
				$.extend(params, @additional_params)
			success:
				callback
		)

	parse: (response) ->
		@total_entries = response.total_entries
		response.results