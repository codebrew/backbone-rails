<%= view_namespace %> ||= {}

class <%= view_namespace %>.IndexView extends Backbone.View
  template: JST["<%= jst 'index' %>"]
    
  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render');
    
    @options.<%= plural_name %>.bind('refresh', this.addAll);
   
  addAll: () ->
    @options.<%= plural_name %>.each(this.addOne)
  
  addOne: (<%= singular_name %>) ->
    view = new <%= view_namespace %>.<%= singular_name.capitalize %>View({model : <%= singular_name %>})
    this.$("tbody").append(view.render().el)
       
  render: ->
    $(this.el).html(this.template(<%= plural_name %>: this.options.<%= plural_name %>.toJSON() ))
    @addAll()
    
    return this