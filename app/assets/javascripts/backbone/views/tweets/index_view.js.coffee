Agrigator.Views.Tweets ||= {}

class Agrigator.Views.Tweets.IndexView extends Agrigator.Views.Tweets.PrototypeView
  template: JST["backbone/templates/tweets/index"]

  events:
    "submit .navbar-search" : "run_search"
    "click #add_tweet"      : "show_form"

  el: '#container'

  initialize: () ->
    @collection.additional_params = {}
    @collection.additional_params = @options.additional
    @collection.on('reset', @addAll, @)
    @collection.on('add', @addOne, @)
    @collection.fetch_w_params(false)
    @render()

  addAll: () =>
    @$el.find("#tweets").html('')
    if (@collection.length == 0)
      @empty_set() 
    else
      @$el.find('#add_tweet').show()
      @collection.forEach(@addOne, @)

  empty_set: ->
    @$el.find('#add_tweet').hide()
    template = JST["backbone/templates/tweets/empty"]
    @$el.find("#tweets").html(template())

  addOne: (tweet) =>
    if (typeof(tweet.id) != 'undefined')
      view = new Agrigator.Views.Tweets.TweetView({model : tweet})
      @$el.find("#tweets").append(view.render().el)
  
  run_search: (e)->
    @cancel_event(e)
    word = $(e.target).find('input').val()
    window.router.navigate("#search/#{word}")
    @collection.additional_params = {}
    @collection.additional_params['query'] = word
    @collection.fetch_w_params(false, ->)

  show_form: (e)->
    @cancel_event(e)
    @toggle_tweet_form()
    new Agrigator.Views.Tweets.NewView({ collection: @collection })   

  render: =>
    @$el.html(@template())
    @$el.find("#tweet_form").hide()
    return this
