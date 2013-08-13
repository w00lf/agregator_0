class Agrigator.Routers.MainsRouter extends Backbone.Router
	initialize: (options) ->

	routes:
		"attachments"	: "attachments"
		

	attachments: ->
		@attachments = new Agrigator.Collections.AttachmentsCollection()
		@view = new Agrigator.Views.Attachments.IndexView({ collection: @attachments })
		@paginatorView = new Agrigator.Views.PaginatedView({ collection : @attachments })
   
  
