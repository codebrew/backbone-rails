<%= view_namespace %> ||= {}

class <%= view_namespace %>.NewView extends Backbone.View    
  template: JST["<%= jst 'new' %>"]
  
  events:
    "submit #new-<%= singular_name %>": "save"
    
  constructor: (options) ->
    super(options)
    @options.model = new @options.collection.model()

    @options.model.bind("change:errors", () =>
      this.render()
    )
    
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
      
    @options.model.unset("errors")
    
    @options.collection.create(@options.model.toJSON(), 
      success: (model) =>
        @options.model = model
        window.location.hash = "/#{@options.model.id}"
        
      error: (model, jqXHR) =>
        @options.model.set({errors: $.parseJSON(jqXHR.responseText)})
    )
    
  render: ->
    $(this.el).html(this.template(@options.model.toJSON() ))
    
    this.$("form").backboneLink(@options.model)
    
    return this