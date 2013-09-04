Agrigator.Views.Tweets ||= {}

class Agrigator.Views.Tweets.IndexView extends Backbone.View
  template: JST["backbone/templates/tweets/index"]

  events:
    "keyup .navbar-search input" : "search"
    "click #add_tweet"           : "show_form"

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
    if (typeof(tweet.id) != 'undefined') 
      view = new Agrigator.Views.Tweets.TweetView({model : tweet})
      @$el.find("#tweets").append(view.render().el)
  
  search: (e)->
    word = $(e.target).val()
    @collection.query = word
    @collection.fetch_w_params(true, ->)

  show_form: (e)->
    e.preventDefault()
    e.stopPropagation()
    new Agrigator.Views.Tweets.NewView({ collection: @collection })   
    @toggle_add()
  
  toggle_add: ()->
    @$el.find('#add_tweet').add("#tweet_form").toggle()

  render: =>
    @$el.html(@template())
    @$el.find("#tweet_form").hide()
    return this
