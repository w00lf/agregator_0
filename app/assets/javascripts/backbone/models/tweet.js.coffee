class Agrigator.Models.Tweet extends Backbone.Model
  paramRoot: 'tweet'

class Agrigator.Collections.TweetsCollection extends Backbone.Collection
  model: Agrigator.Models.Tweet
  url: '/tweets'

  initialize: ->
    @fetch_w_params()

  query: ''

  per_page: 13

  page_active: 1

  order: ''

  fetch_w_params: (reload) ->
    if(reload) 
      page = 1
    @fetch( 
      add: true
      data:  
        order: @order
        query: @query
        per_page: @per_page
        page: @page_active
    )

  parse: (response) ->
    @total_entries = response.total_entries
    response.results
