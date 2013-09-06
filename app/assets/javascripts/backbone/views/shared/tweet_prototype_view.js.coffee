Agrigator.Views.Tweets ||= {}

class Agrigator.Views.Tweets.PrototypeView extends Backbone.View
    bind_wsyng: ->
        if (CKEDITOR.instances['content']) 
            CKEDITOR.remove(CKEDITOR.instances['content']);
        CKEDITOR.replace('content', {"language":"en","class":"someclass","ckeditor":{"language":"ru"}})

    get_wsyng_content: ->
        CKEDITOR.instances.content.getData()

    toggle_tweet_form: ->
        $('#add_tweet').add("#tweet_form").toggle()

    cancel_event: (e)->
        e.preventDefault()
        e.stopPropagation()

    destroy: ->
        @undelegateEvents()
        @$el.removeData().unbind()

    clean: ->
        @undelegateEvents()
        @$el.removeData().unbind()