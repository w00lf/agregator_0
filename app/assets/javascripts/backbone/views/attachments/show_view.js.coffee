Agrigator.Views.Attachments ||= {}

class Agrigator.Views.Attachments.ShowView extends Backbone.View
  template: JST["backbone/templates/attachments/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
