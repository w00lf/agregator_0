class Agrigator.Routers.CategoriesRouter extends Backbone.Router
  initialize: (options) ->
    @categories = new Agrigator.Collections.CategoriesCollection()
    @categories.reset options.categories

  routes:
    "new"      : "newCategories"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newCategories: ->
    @view = new Agrigator.Views.Categories.NewView(collection: @categories)
    $("#categories").html(@view.render().el)

  index: ->
    @view = new Agrigator.Views.Categories.IndexView(categories: @categories)
    $("#categories").html(@view.render().el)

  show: (id) ->
    categories = @categories.get(id)

    @view = new Agrigator.Views.Categories.ShowView(model: categories)
    $("#categories").html(@view.render().el)

  edit: (id) ->
    categories = @categories.get(id)

    @view = new Agrigator.Views.Categories.EditView(model: categories)
    $("#categories").html(@view.render().el)
