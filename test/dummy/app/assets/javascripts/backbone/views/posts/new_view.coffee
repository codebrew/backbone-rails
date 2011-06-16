Dummy.Views.Posts ||= {}

class Dummy.Views.Posts.NewView extends Backbone.View
  template: JST["backbone/templates/posts/new"]
  
  events:
    "submit #project-form": "save"
    
  save: ->
    @options.model.save()
    return false
    
  render: ->
    $(this.el).html(this.template(this.options.model.toJSON() ))
    
    this.$("form").backboneLink(@options.model)
    
    return this