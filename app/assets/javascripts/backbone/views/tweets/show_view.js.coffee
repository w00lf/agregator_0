Agrigator.Views.Tweets ||= {}

class Agrigator.Views.Tweets.ShowView extends Backbone.View
  template: JST["backbone/templates/tweets/show"]

  el: '#container'

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
