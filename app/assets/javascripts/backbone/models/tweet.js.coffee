class Agrigator.Models.Tweet extends Backbone.Model
	paramRoot: 'tweet'

class Agrigator.Collections.TweetsCollection extends Agrigator.Collections.PaginatedCollection
	model: Agrigator.Models.Tweet
	url: '/tweets'