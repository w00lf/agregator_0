Agrigator.Views.Tweets ||= {}

class Agrigator.Views.Tweets.EditView extends Backbone.View
  template : JST["backbone/templates/tweets/edit"]

  el: '#container'

  initialize: ->
    @render()

  events :
    "submit #edit-tweet" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    console.log(CKEDITOR.instances.content.getData())
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
    if (CKEDITOR.instances['content']) 
      CKEDITOR.remove(CKEDITOR.instances['content']);
    CKEDITOR.replace('content', {"language":"en","class":"someclass","ckeditor":{"language":"ru"}})
    return this
