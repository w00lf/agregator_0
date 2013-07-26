class Agrigator.Models.Attachment extends Backbone.Model
  paramRoot: 'attachment'

class Agrigator.Collections.AttachmentsCollection extends Backbone.Collection
  model: Agrigator.Models.Attachment
  url: '/attachments'
