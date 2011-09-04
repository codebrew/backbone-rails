Dummy.Views.Posts ||= {}

class Dummy.Views.Posts.PostView extends Backbone.View
  template: JST["backbone/templates/posts/post"]
  
  events:
    "click .destroy" : "destroy"
      
  tagName: "tr"
  
  destroy: () ->
    @options.model.destroy()
    this.remove()
    
    return false
    
  render: ->
    $(this.el).html(@template(@options.model.toJSON() ))    
    return this