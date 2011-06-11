<%= view_namespace %> ||= {}

class <%= view_namespace %>.NewView extends Backbone.View
  template: JST["<%= jst 'new' %>"]
  
  events:
    "submit #project-form": "save"
    
  save: ->
    @options.model.save()
    return false
    
  render: ->
    $(this.el).html(this.template()(this.options.model.toJSON() ))
    
    this.$("form").backboneLink(@options.model)
    
    return this