<%= view_namespace %> ||= {}

class <%= view_namespace %>.NewView extends Backbone.View
  template: JST["<%= jst 'new' %>"]
  
  events:
    "submit #new-<%= singular_name %>": "save"
    
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