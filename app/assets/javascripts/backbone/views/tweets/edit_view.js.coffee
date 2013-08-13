Agrigator.Views.Tweets ||= {}

class Agrigator.Views.Tweets.EditView extends Backbone.View
  template : JST["backbone/templates/tweets/edit"]

  events :
    "submit #edit-tweet" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (tweet) =>
        @model = tweet
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
