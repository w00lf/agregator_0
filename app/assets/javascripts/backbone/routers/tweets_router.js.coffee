class Agrigator.Routers.TweetsRouter extends Backbone.Router
  initialize: (options) ->
    window.tweets = new Agrigator.Collections.TweetsCollection()
    window.categories = new Agrigator.Collections.CategoriesCollection()

  routes:
    "search/:query"         : "search"
    "category/:category_id" : "category"
    "index"                 : "index"
    ".*"                    : "index"

  index: ->
    if (@view)
      @view.clean()
    params = @get_params()
    @run_index(params)

  search: (query)->
    params = @get_params("query", query)
    @run_index(params)

  category: (category_id) ->
    params = @get_params("category_id", category_id)
    @run_index(params)

  get_params: (name, variable)->
    result = { collection : window.tweets }
    result.additional = {}
    if (typeof(variable) != 'undefined')
      result.additional[name] = variable
    return result

  run_index: (params)->
    window.tweets.off()
    window.categories.off()
    @view = new Agrigator.Views.Tweets.IndexView( params )
    @paginatorView = new Agrigator.Views.PaginatedView({ collection : window.tweets })  
    @categories_view = new Agrigator.Views.Categories.IndexView({ collection: window.categories })
    @categories_new_view = new Agrigator.Views.Categories.NewView({ collection: window.categories })
    

  edit: (id) ->
    tweet = @tweets.get(id)
    @view = new Agrigator.Views.Tweets.EditView({ model: tweet }) 
    @paginatorView.remove()


