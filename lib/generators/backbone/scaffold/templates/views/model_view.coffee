<%= view_namespace %> ||= {}

class <%= view_namespace %>.<%= singular_name.capitalize %>View extends Backbone.View
  template: JST["<%= jst singular_name %>"]
  
  events:
    "click .destroy" : "destroy"
      
  tagName: "tr"
  
  destroy: () ->
    @options.model.destroy()
    this.remove()
    
    return false
    
  render: ->
    $(this.el).html(this.template()(this.options.model.toJSON() ))    
    return this