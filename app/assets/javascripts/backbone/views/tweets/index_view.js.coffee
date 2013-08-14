Agrigator.Views.Tweets ||= {}

class Agrigator.Views.Tweets.IndexView extends Backbone.View
  template: JST["backbone/templates/tweets/index"]

  el: '#container'

  initialize: () ->
    @collection.on('add', @addOne, @)
    @collection.fetch_w_params(true, @render)

  addAll: () =>
    @collection.forEach(@addOne, @)

  addOne: (tweet) =>
    view = new Agrigator.Views.Tweets.TweetView({model : tweet})
    @$el.find("#tweets").append(view.render().el)

  render: =>
    @$el.html(@template())
    @addAll()
    return this
