class Agrigator.Routers.AttachmentsRouter extends Backbone.Router
  initialize: (options) ->
    @attachments = new Agrigator.Collections.AttachmentsCollection()

  routes:
    ""    : "index"

  index: ->
    @view = new Agrigator.Views.Attachments.IndexView({ collection: @attachments })
    @paginatorView = new Agrigator.Views.PaginatedView({ collection : @attachments })