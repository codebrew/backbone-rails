<%= view_namespace %> ||= {}

class <%= view_namespace %>.<%= singular_name.camelize %>View extends Backbone.View
  template: JST["<%= jst singular_name %>"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    getViewAndCollection = ((view) -> return -> {collection: view.collection, view: view})(this)
    
    @model.destroy
      success: (model, response) ->
        vars = getViewAndCollection()
        vars.collection.remove model
        vars.view.remove()
      error: (model, response) ->
        # handle error as you desire
        # remember to change the custom Rails destroy controller action
        # change format.json { head :ok } with format.json { render json: @user }        
        
    return false

  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    return this