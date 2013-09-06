Agrigator.Views.Tweets ||= {}

class Agrigator.Views.Tweets.TweetView extends Agrigator.Views.Tweets.PrototypeView
  template: JST["backbone/templates/tweets/tweet"]

  events:
    "click .destroy"        : "destroy"
    "click .edit"           : "show_edit_form"
    "click .tweet_content"  : "show_full"
    "mouseover"             : "control_panell"
    "mouseout"              : "control_panell"

  show_full: ->
    @$el.find('.tweet_content').toggleClass('truncated')
    return false

  control_panell: ->
    @$el.find('h5 span').toggle()

  destroy: () ->
    @model.destroy()
    this.remove()
    return false

  show_edit_form: (e)->
    e.preventDefault()
    e.stopPropagation()
    view = new Agrigator.Views.Tweets.EditView({ model: @model })
    @$el.html(view.render().el)
    @bind_wsyng()

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    @$el.find('h5 span').hide()
    return this
