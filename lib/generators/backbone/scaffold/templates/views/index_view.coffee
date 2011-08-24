<%= view_namespace %> ||= {}

class <%= view_namespace %>.IndexView extends Backbone.View
  template: JST["<%= jst 'index' %>"]

  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render');

    @options.<%= underscored_plural_model_name %>.bind('reset', this.addAll);

  addAll: () ->
    @options.<%= underscored_plural_model_name %>.each(this.addOne)

  addOne: (<%= singular_model_name %>) ->
    view = new <%= view_namespace %>.<%= singular_name.camelize %>View({model : <%= singular_model_name %>})
    this.$("tbody").append(view.render().el)

  render: ->
    $(this.el).html(this.template(<%= plural_model_name %>: this.options.<%= underscored_plural_model_name %>.toJSON() ))
    @addAll()

    return this