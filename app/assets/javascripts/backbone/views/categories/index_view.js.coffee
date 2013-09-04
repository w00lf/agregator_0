Agrigator.Views.Categories ||= {}

class Agrigator.Views.Categories.IndexView extends Backbone.View
  template: JST["backbone/templates/categories/index"]
  
  events:
    "click #add_category a" : "add_category"

  el: '#categories'

  initialize: () ->
    @collection.bind('reset', @addAll)
    @collection.fetch()
    @render()

  addAll: () =>
    @collection.each(@addOne)

  addOne: (categories) =>
    if (typeof(categories) != 'undefined')
      view = new Agrigator.Views.Categories.CategoriesView({model : categories})
      @$el.append(view.render().el)
  
  addedOne: (categories) =>
    @addOne(categories)
    @toggle_add()

  add_category: (e)->
    e.preventDefault()
    e.stopPropagation()
    @toggle_add()
  
  toggle_add: ()->
    @$el.find('#add_category').add("#form_category").toggle()

  render: =>
    @$el.html(@template())
    @$el.find("#form_category").hide()
    @addAll()
    return this
