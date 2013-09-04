Agrigator.Views.Categories ||= {}

class Agrigator.Views.Categories.NewView extends Backbone.View
  template: JST["backbone/templates/categories/new"]
  el: "#form_category"
  
  events:
    "submit #new-categories": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    @model.bind("change:errors", () =>
      this.render()
    )
    @render()

  save: (e) =>
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (categories) =>
        view = new Agrigator.Views.Categories.CategoriesView({model : categories})
        $('#categories').append(view.render().el)
        @$el.parents('div').find('#add_category').add("#form_category").toggle()
        @$el.html('')
        @model = categories
        @destroy()
    
      error: (categories, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  destroy: ->
    @undelegateEvents()
    @$el.removeData().unbind()

  render: ->
    $(@el).html(@template(@model.toJSON()))
    this.$("form").backboneLink(@model)

    return this
