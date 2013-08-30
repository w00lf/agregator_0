Agrigator.Views.Categories ||= {}

class Agrigator.Views.Categories.NewView extends Backbone.View
  template: JST["backbone/templates/categories/new"]

  events:
    "submit #new-categories": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (categories) =>
        @model = categories
        window.location.hash = "/#{@model.id}"

      error: (categories, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
