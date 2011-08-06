#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.<%= application_name.camelize %> =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}