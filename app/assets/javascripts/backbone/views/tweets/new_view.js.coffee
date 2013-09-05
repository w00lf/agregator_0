Agrigator.Views.Tweets ||= {}

class Agrigator.Views.Tweets.NewView extends Backbone.View
  template: JST["backbone/templates/tweets/new"]

  el: '#tweet_form'

  events:
    "submit #new-tweet": "save"
    
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
    e.preventDefault()
    e.stopPropagation()

    @model.set("content", CKEDITOR.instances.content.getData())
    if (@current_category)
      @model.set("content", CKEDITOR.instances.content.getData())
    @model.unset("errors")
      
    @collection.create(@model.toJSON(),
      success: (tweet) =>
        view = new Agrigator.Views.Tweets.TweetView({model : tweet})
        $("#tweets").prepend(view.render().el)
        @$el.parents('div').find('#add_tweet').add("#tweet_form").toggle()
        @$el.html('')
        @model = tweet
        @destroy()

      error: (tweet, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  destroy: ->
    @undelegateEvents()
    @$el.removeData().unbind()

  addCategories: (category)->
    params = 
      value : category.get('id')
      text : category.get('title')
    if parseInt(@current_category) == parseInt(category.get('id'))
      params.selected = "selected"
    $(@el).find('select').append($('<option>', params ))

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    window.categories.forEach(@addCategories, @)
    this.$("form").backboneLink(@model)
    if (CKEDITOR.instances['content']) 
      CKEDITOR.remove(CKEDITOR.instances['content']);
    CKEDITOR.replace('content', {"language":"en","class":"someclass","ckeditor":{"language":"ru"}})

    return this
