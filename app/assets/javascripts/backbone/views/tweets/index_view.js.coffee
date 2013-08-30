Agrigator.Views.Tweets ||= {}

class Agrigator.Views.Tweets.IndexView extends Backbone.View
  template: JST["backbone/templates/tweets/index"]

  events:
    "keyup .navbar-search input" : "search"

  el: '#container'

  initialize: () ->
    @collection.on('add', @addOne, @)
    @collection.on('reset', @addAll, @)
    @collection.fetch_w_params(true)
    @render()

  addAll: () =>
    @$el.find("#tweets").html('')
    @collection.forEach(@addOne, @)

  addOne: (tweet) =>
    view = new Agrigator.Views.Tweets.TweetView({model : tweet})
    @$el.find("#tweets").append(view.render().el)
  
  search: (e)->
    word = $(e.target).val()
    @collection.query = word
    @collection.reload(->)

  render: =>
    @$el.html(@template())
    return this
