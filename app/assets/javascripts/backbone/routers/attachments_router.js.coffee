class Agrigator.Routers.AttachmentsRouter extends Backbone.Router
  initialize: (options) ->
    @attachments = new Agrigator.Collections.AttachmentsCollection()
    @attachments.reset options.attachments

  routes:
    "new"      : "newAttachment"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"

  newAttachment: ->
    @view = new Agrigator.Views.Attachments.NewView(collection: @attachments)

  index: ->
    @view = new Agrigator.Views.Attachments.IndexView(attachments: @attachments)
    bind_pretty_image()

  show: (id) ->
    attachment = @attachments.get(id)

    @view = new Agrigator.Views.Attachments.ShowView(model: attachment)
    $("#attachments").html(@view.render().el)

  edit: (id) ->
    attachment = @attachments.get(id)

    @view = new Agrigator.Views.Attachments.EditView(model: attachment)
    $("#attachments").html(@view.render().el)
