Agrigator.Views.Categories ||= {}

class Agrigator.Views.Categories.EditView extends Backbone.View
  template : JST["backbone/templates/categories/edit"]

  events :
    "submit #edit-categories" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (categories) =>
        @model = categories
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
