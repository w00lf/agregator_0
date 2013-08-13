class Agrigator.Routers.TweetsRouter extends Backbone.Router
  initialize: (options) ->
    @tweets = new Agrigator.Collections.TweetsCollection()
    @tweets.reset options.tweets

  routes:
    "new"      : "newTweet"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newTweet: ->
    @view = new Agrigator.Views.Tweets.NewView(collection: @tweets)
    $("#tweets").html(@view.render().el)

  index: ->
    @view = new Agrigator.Views.Tweets.IndexView(tweets: @tweets)
    $("#tweets").html(@view.render().el)

  show: (id) ->
    tweet = @tweets.get(id)

    @view = new Agrigator.Views.Tweets.ShowView(model: tweet)
    $("#tweets").html(@view.render().el)

  edit: (id) ->
    tweet = @tweets.get(id)

    @view = new Agrigator.Views.Tweets.EditView(model: tweet)
    $("#tweets").html(@view.render().el)
