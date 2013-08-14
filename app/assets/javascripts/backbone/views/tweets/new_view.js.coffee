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
    
    @model.unset("errors")
    @collection.create(@model.toJSON(),
      success: (tweet) =>
        @model = tweet
        window.location.hash = "tweets"

      error: (tweet, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
