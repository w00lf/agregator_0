Agrigator.Views.Tweets ||= {}

class Agrigator.Views.Tweets.NewView extends Backbone.View
  template: JST["backbone/templates/tweets/new"]

  el: '#container'

  events:
    "submit #new-tweet": "save"
    
  constructor: (options) ->
    window.collection = @collection
    super(options)
    @model = new @collection.model()
    

    @model.bind("change:errors", () =>
      this.render()
    )
    @render()

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.set("content", CKEDITOR.instances.content.getData())

    @model.unset("errors")
    @collection.create(@model.toJSON(),
      success: (tweet) =>
        @model = tweet
        @destroy()
        window.location.hash = "tweets"

      error: (tweet, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  destroy: ->
    @undelegateEvents()
    @$el.removeData().unbind()
    

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)
    if (CKEDITOR.instances['content']) 
      CKEDITOR.remove(CKEDITOR.instances['content']);
    CKEDITOR.replace('content', {"language":"en","class":"someclass","ckeditor":{"language":"ru"}})

    return this
