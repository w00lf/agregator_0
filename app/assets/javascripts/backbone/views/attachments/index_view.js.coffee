Agrigator.Views.Attachments ||= {}

class Agrigator.Views.Attachments.IndexView extends Backbone.View
  template: JST["backbone/templates/attachments/index"]
  el: '#attachments'

  initialize: () ->
    @options.attachments.bind('reset', @addAll)
    @render()

  addAll: () =>
    @options.attachments.each(@addOne)

  addOne: (attachment) =>
    console.log(attachment)
    view = new Agrigator.Views.Attachments.AttachmentView({model : attachment})
    @$el.append(view.render().el)

  render: =>
    self = @
    $("#fileupload").fileupload(
    ).bind("fileuploaddone", (e, data) ->
      response = data.result[0]
      last = self.options.attachments.add([response]).last()
      self.addOne last
      $(this).find('.files').html('')
      bind_pretty_image()
    )
    @addAll()
    return this
