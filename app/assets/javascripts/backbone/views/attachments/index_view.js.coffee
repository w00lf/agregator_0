Agrigator.Views.Attachments ||= {}

class Agrigator.Views.Attachments.IndexView extends Backbone.View
  template: JST["backbone/templates/attachments/index"]
  el: '#attachments'

  initialize: () ->
    @collection.on('add', @addOne, @)
    @render()

  addAll: () =>
    @collection.forEach(@addOne, @)
    @bind_pretty_image()

  addOne: (attachment) =>
    view = new Agrigator.Views.Attachments.AttachmentView({model : attachment})
    @$el.append($(view.render().el))
    @bind_pretty_image()

  bind_pretty_image: ->
    $("#attachments .thumbnail > a").prettyPhoto(
      autoplay_slideshow: false
      opacity: 0.80
      allow_resize: true 
    )

  bind_file_upload: ->
    self = @
    $("#progress").hide()
    $("#fileupload").fileupload(
      url: "/attachments"
      dataType: "json"
      add: (e, data) ->
        $("#progress").show()
        data.submit()

      done: (e, data) ->
        $("#progress").hide()
        response = data.result[0]
        last = self.collection.add([response]).last()

      progressall: (e, data) ->
        progress = parseInt(data.loaded / data.total * 100, 10)
        $("#progress .bar").css "width", progress + "%"
    ).prop("disabled", not $.support.fileInput).parent().addClass (if $.support.fileInput then `undefined` else "disabled")

  render: =>
    @bind_file_upload()
    @addAll()
    return this
