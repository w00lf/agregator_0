Agrigator.Views.Attachments ||= {}

class Agrigator.Views.Attachments.NewView extends Backbone.View
  template: JST["backbone/templates/attachments/new"]

  events:
    "submit #new-attachment": "save"

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
      success: (attachment) =>
        @model = attachment
        window.location.hash = "/#{@model.id}"

      error: (attachment, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
