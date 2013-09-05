Agrigator.Views.Tweets ||= {}

class Agrigator.Views.Tweets.IndexView extends Backbone.View
  template: JST["backbone/templates/tweets/index"]

  events:
    "submit .navbar-search" : "run_search"
    "click #add_tweet"      : "show_form"
    "click #back"           : "go_back"

  el: '#container'

  initialize: () ->
    @collection.additional_params = {}
    if (typeof(@options.query) != 'undefined')
      @collection.additional_params['query'] = @options.query     
    if (typeof(@options.category_id) != 'undefined')
      @collection.additional_params['category_id'] = @options.category_id    
    @collection.on('add', @addOne, @)
    @collection.on('reset', @addAll, @)
    @collection.fetch_w_params(false)
    @render()
    @categories_view = new Agrigator.Views.Categories.IndexView({ collection: window.categories })
    @categories_new_view = new Agrigator.Views.Categories.NewView({ collection: window.categories })

  addAll: () =>
    @$el.find("#tweets").html('')
    if (@collection.length == 0)
      @empty_set() 
    else
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
    e.preventDefault()
    e.stopPropagation()
    word = $(e.target).find('input').val()
    window.router.navigate("#search/#{word}")
    @collection.additional_params = {}
    @collection.additional_params['query'] = word
    @collection.fetch_w_params(false, ->)
      
  go_back: (e)->
    e.preventDefault()
    e.stopPropagation()
    @$el.find('#add_tweet').show()
    @collection.additional_params = {}
    @collection.fetch_w_params(false)

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
