Agrigator.Views.Tweets ||= {}

class Agrigator.Views.Tweets.IndexView extends Backbone.View
  template: JST["backbone/templates/tweets/index"]

  el: '#container'

  initialize: () ->
    @collection.bind('reset', @addAll)
    @render()

  addAll: () =>
    @collection.forEach(@addOne, @)

  addOne: (tweet) =>
    view = new Agrigator.Views.Tweets.TweetView({model : tweet})
    @$el.find("tbody").append(view.render().el)

  render: =>
    @$el.html(@template())
    @addAll()
    return this
