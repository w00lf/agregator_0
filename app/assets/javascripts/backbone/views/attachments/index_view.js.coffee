Agrigator.Views.Attachments ||= {}

class Agrigator.Views.Attachments.IndexView extends Backbone.View
  template: JST["backbone/templates/attachments/index"]
  el: '#attachments'

  initialize: () ->
    @options.attachments.bind('reset', @addAll)

  addAll: () =>
    @options.attachments.each(@addOne)

  addOne: (attachment) =>
    view = new Agrigator.Views.Attachments.AttachmentView({model : attachment})
    console.log(@$el)
    console.log($(@el))
    $(@el).append(view.render().el)

  render: =>
    $(@el).html(@template(attachments: @options.attachments.toJSON() ))
    @addAll()
    return this
