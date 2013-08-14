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
    @model.content = CKEDITOR.instances.content.getData()
    console.log(CKEDITOR.instances.content.getData())

    @model.save({ content: CKEDITOR.instances.content.getData() },
                success : (tweet) =>
                  @model = tweet
                  window.location.hash = "tweets")

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)
    if (CKEDITOR.instances['content']) 
      CKEDITOR.remove(CKEDITOR.instances['content']);
    CKEDITOR.replace('content', {"language":"en","class":"someclass","ckeditor":{"language":"ru"}})
    return this
