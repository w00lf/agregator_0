class Agrigator.Routers.MainsRouter extends Backbone.Router
	initialize: (options) ->
		@tweets = new Agrigator.Collections.TweetsCollection()
		@attachments = new Agrigator.Collections.AttachmentsCollection()

	routes:
		"attachments"		: "attachments"
		"tweets/new"		: "tweetsNew"	
		"tweets/:id"		: "tweetsShow"	
		"tweets/:id/edit"	: "tweetsEdit"	
		"tweets"			: "tweetsIndex"	
		

	attachments: ->
		@view = new Agrigator.Views.Attachments.IndexView({ collection: @attachments })
		@paginatorView = new Agrigator.Views.PaginatedView({ collection : @attachments })

	tweetsIndex: ->
		@view = new Agrigator.Views.Tweets.IndexView({ collection: @tweets })
		@paginatorView = new Agrigator.Views.PaginatedView({ collection : @tweets })

	tweetsNew: ->
		@tweets = new Agrigator.Collections.TweetsCollection()
		@view = new Agrigator.Views.Tweets.NewView({ collection: @tweets })		
		@paginatorView.remove()

	tweetsShow: (id)->

	tweetsEdit: (id)->
		tweet = @tweets.get(id)
		@view = new Agrigator.Views.Tweets.EditView({ model: tweet })	
		@paginatorView.remove()
  
