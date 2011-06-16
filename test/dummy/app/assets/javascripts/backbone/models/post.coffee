class Dummy.Models.Post extends Backbone.Model
  paramRoot: 'post'
  
class Dummy.Collections.PostsCollection extends Backbone.Collection
  model: Dummy.Models.Post
  url: '/posts'