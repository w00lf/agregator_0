class Agrigator.Models.Attachment extends Backbone.Model
  paramRoot: 'attachment'

class Agrigator.Collections.AttachmentsCollection extends Agrigator.Collections.PaginatedCollection
  model: Agrigator.Models.Attachment
  url: '/attachments'