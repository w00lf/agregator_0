Agrigator.Views.Tweets ||= {}

class Agrigator.Views.Tweets.NewView extends Agrigator.Views.Tweets.PrototypeView
  template: JST["backbone/templates/tweets/new"]

  el: '#tweet_form'

  events:
    "submit #new-tweet" : "save"
    "click .cancel"     : "return_view"
    
  constructor: (options) ->
    window.collection = @collection
    super(options)
    @model = new @collection.model()
    
    @model.bind("change:errors", () =>
      this.render()
    )
    if (typeof(window.tweets.additional_params.category_id) != 'undefined')
      @current_category = window.tweets.additional_params.category_id
    @render()

  save: (e) ->
    @cancel_event(e)

    @model.set("content", @get_wsyng_content())
    @model.set("category_id", @$el.find('[name=category_id]').val())
    @model.unset("errors")
    #choosen_category = @$el.find('[name=category_id]').val()
    console.log(@model)
      
    @collection.create(@model.toJSON(),
      success: (tweet) =>
        #if (@current_category == choosen_category)
        view = new Agrigator.Views.Tweets.TweetView({model : tweet})
        $("#tweets").prepend(view.render().el)
        @toggle_tweet_form()
        @$el.html('')
        @model = tweet
        @destroy()

      error: (tweet, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  addCategories: (category)->
    params = 
      value : category.get('id')
      text : category.get('title')
    if parseInt(@current_category) == parseInt(category.get('id'))
      params.selected = "selected"
    $(@el).find('select').append($('<option>', params ))

  return_view: (e)->
    @cancel_event(e)
    @.remove()
    @destroy()

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    window.categories.forEach(@addCategories, @)
    this.$("form").backboneLink(@model)
    @bind_wsyng()
    return this
