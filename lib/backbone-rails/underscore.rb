class Underscore
  JST_START = "(function(){"
  JST_END = "})();"
  NAMESPACE = "JST"
  SETUP_NAMESPACE = "#{NAMESPACE} = #{NAMESPACE} || {};"
  
  def self.render(name, data)
    template = "#{NAMESPACE}[#{name}] = _.template(#{data});"
    
    [JST_START, SETUP_NAMESPACE, template, JST_END].join("\n")
  end
  
end