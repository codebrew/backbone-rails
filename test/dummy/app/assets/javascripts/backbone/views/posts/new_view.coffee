Dummy.Views.Posts ||= {}

class Dummy.Views.Posts.NewView extends Backbone.View
  template: JST["backbone/templates/posts/new"]
  
  events:
    "submit #new-post": "save"
    
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
      
    @options.collection.create(@options.model.toJSON(), 
      success: (model) =>
        @options.model = model
        window.location.hash = "/#{@options.model.id}"
    )
    
  render: ->
    @options.model = new @options.collection.model()
    $(this.el).html(this.template(@options.model.toJSON() ))
    
    this.$("form").backboneLink(@options.model)
    
    return this