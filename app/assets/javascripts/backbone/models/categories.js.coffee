class Agrigator.Models.Categories extends Backbone.Model
  paramRoot: 'category'

class Agrigator.Collections.CategoriesCollection extends Backbone.Collection
  model: Agrigator.Models.Categories
  url: '/categories'
