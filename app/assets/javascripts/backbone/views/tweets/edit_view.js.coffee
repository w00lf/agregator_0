Agrigator.Views.Tweets ||= {}

class Agrigator.Views.Tweets.EditView extends Backbone.View
  template : JST["backbone/templates/tweets/edit"]

  events :
    "submit #edit-tweet" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    @model.set("content", CKEDITOR.instances.content.getData())

    @model.save(null,
                success : (tweet) =>
                  @model = tweet
                  @destroy()
                  window.location.hash = "tweets")
  destroy: ->
    @undelegateEvents()
    @$el.removeData().unbind()

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)
   
    return this
