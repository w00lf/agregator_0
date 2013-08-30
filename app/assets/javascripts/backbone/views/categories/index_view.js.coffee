Agrigator.Views.Categories ||= {}

class Agrigator.Views.Categories.IndexView extends Backbone.View
  template: JST["backbone/templates/categories/index"]
  
  events:
    "click #add_category a" : "add_category"
    "keyup #save_category input" : "save_category"

  el: '#categories'

  initialize: () ->
    @collection.bind('reset', @addAll)
    @collection.on('add', @addOne, @)
    @collection.fetch()
    @render()

  addAll: () =>
    @collection.each(@addOne)

  addOne: (categories) =>
    view = new Agrigator.Views.Categories.CategoriesView({model : categories})
    @$el.append(view.render().el)

  add_category: (e)->
    e.preventDefault()
    e.stopPropagation()
    @$el.find('#add_category').add("#save_category").toggle()

  save_category: (e)->
    code = if e.keyCode then e.keyCode else e.which

    if(code == 13) 
      @model = new @collection.model()
      @model.set("title", @$el.find("input").val())
      @collection.create(@model.toJSON(),      
        success: (tweet) =>
          @model = tweet
          console.log(@model))
      @$el.find('#add_category').add("#save_category").toggle()

  render: =>
    @$el.html(@template())
    @$el.find("#save_category").hide()
    @addAll()
    return this
