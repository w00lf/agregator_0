Agrigator.Views.Attachments ||= {}

class Agrigator.Views.Attachments.AttachmentView extends Backbone.View
  template: JST["backbone/templates/attachments/attachment"]

  events:
    "click .destroy" : "destroy"

  tagName: "li"

  destroy: () ->
    @model.destroy()
    this.remove()
    return false

  render: ->
    @$el.html(@template( @model.toJSON() )).addClass("span1")
    return this
