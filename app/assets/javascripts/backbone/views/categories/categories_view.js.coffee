Agrigator.Views.Categories ||= {}

class Agrigator.Views.Categories.CategoriesView extends Backbone.View
  template: JST["backbone/templates/categories/categories"]

  events:
    "click .destroy" : "destroy"

  tagName: "div"

  destroy: () ->
    @model.destroy()
    this.remove()
    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
