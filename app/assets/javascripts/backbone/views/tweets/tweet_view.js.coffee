Agrigator.Views.Tweets ||= {}

class Agrigator.Views.Tweets.TweetView extends Backbone.View
  template: JST["backbone/templates/tweets/tweet"]

  events:
    "click .destroy" : "destroy"
    "click .tweet_content" : "show_full"
    "mouseover" : "control_panell"
    "mouseout" : "hide_control_pannell"

  show_full: ->
    @$el.find('.tweet_content').toggleClass('truncated')
    return false

  control_panell: ->
    @$el.find('h5 span').show()

  hide_control_pannell: ->
    @$el.find('h5 span').hide()    

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    @$el.find('h5 span').hide()
    return this
