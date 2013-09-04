class Agrigator.Routers.TweetsRouter extends Backbone.Router
  initialize: (options) ->
    window.tweets = new Agrigator.Collections.TweetsCollection()
    window.categories = new Agrigator.Collections.CategoriesCollection()

  routes:
    "new"      : "newTweet"
    "index"    : "index"
    ":id/edit" : "edit"
    ".*"       : "index"

  index: ->
    @view = new Agrigator.Views.Tweets.IndexView({ collection: window.tweets })
    @categories_view = new Agrigator.Views.Categories.IndexView({ collection: window.categories })
    @categories_new_view = new Agrigator.Views.Categories.NewView({ collection: window.categories })
    @paginatorView = new Agrigator.Views.PaginatedView({ collection : window.tweets })

  edit: (id) ->
    tweet = @tweets.get(id)
    @view = new Agrigator.Views.Tweets.EditView({ model: tweet }) 
    @paginatorView.remove()