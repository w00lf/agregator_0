class Agrigator.Routers.TweetsRouter extends Backbone.Router
  initialize: (options) ->
    @tweets = new Agrigator.Collections.TweetsCollection()
    @categories = new Agrigator.Collections.CategoriesCollection()

  routes:
    "new"      : "newTweet"
    "index"    : "index"
    ":id/edit" : "edit"
    ".*"       : "index"

  newTweet: ->
    @tweets = new Agrigator.Collections.TweetsCollection()
    @view = new Agrigator.Views.Tweets.NewView({ collection: @tweets })   
    @paginatorView.remove()

  index: ->
    @view = new Agrigator.Views.Tweets.IndexView({ collection: @tweets })
    @categories_view = new Agrigator.Views.Categories.IndexView({ collection: @categories })
    @paginatorView = new Agrigator.Views.PaginatedView({ collection : @tweets })

  edit: (id) ->
    tweet = @tweets.get(id)
    @view = new Agrigator.Views.Tweets.EditView({ model: tweet }) 
    @paginatorView.remove()