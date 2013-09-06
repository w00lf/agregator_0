Agrigator.Views.Tweets ||= {}

class Agrigator.Views.Tweets.EditView extends Agrigator.Views.Tweets.PrototypeView
  template : JST["backbone/templates/tweets/edit"]

  events :
    "submit #edit-tweet" : "update"
    "click .cancel"      : "return_view"

  update : (e) ->
    @cancel_event(e)
    @model.set("content", @get_wsyng_content())

    @model.save(null,
                success : (tweet) =>
                  @model = tweet
                  @return_view())
  cancel_edit: (e)->
    @cancel_event(e)
    return_view()

  return_view: ->
    view = new Agrigator.Views.Tweets.TweetView({model : @model})
    @$el.parent('div').html(view.render().el)
    @destroy()

  render : ->
    $(@el).html(@template(@model.toJSON() ))
    this.$("form").backboneLink(@model)   
    return this
