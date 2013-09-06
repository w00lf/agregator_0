Agrigator.Views.Categories ||= {}

class Agrigator.Views.Categories.CategoriesView extends Backbone.View
  template: JST["backbone/templates/categories/categories"]

  events:
    "click .destroy" : "destroy"
    "click h5 > a"   : "tweets_category"
    "mouseover" : "control_panell"
    "mouseout" : "hide_control_pannell"


  tagName: "div"

  destroy: () ->
    @model.destroy()
    this.remove()
    return false

  control_panell: ->
    @$el.find('h5 span').show()

  hide_control_pannell: ->
    @$el.find('h5 span').hide()   

  tweets_category: (e)->
    e.preventDefault()
    e.stopPropagation()
    @set_selected()
    cat_id = @model.get('id')
    window.tweets.additional_params = {}
    window.tweets.additional_params['category_id'] = cat_id
    window.router.navigate("#category/#{cat_id}")
    window.tweets.fetch_w_params(false, ->)

  set_selected: ->
    $('#categories > div').removeClass('selected')
    @$el.addClass('selected')

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    @$el.find('h5 span').hide()
    return this
