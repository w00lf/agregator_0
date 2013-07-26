Agrigator.Views.Attachments ||= {}

class Agrigator.Views.Attachments.EditView extends Backbone.View
  template : JST["backbone/templates/attachments/edit"]

  events :
    "submit #edit-attachment" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (attachment) =>
        @model = attachment
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
