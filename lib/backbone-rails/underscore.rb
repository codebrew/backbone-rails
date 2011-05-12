class Underscore
  extend ActionView::Helpers::JavaScriptHelper
  
  JST_START = "(function(){"
  JST_END = "}).call(this);"
  NAMESPACE = "JST"
  SETUP_NAMESPACE = "window.#{NAMESPACE} = window.#{NAMESPACE} || {};"
  
  def self.render(name, data)
    # template = "#{NAMESPACE}['#{name}'] = _.template( '#{data}' );"
    template = "window.#{NAMESPACE}['#{name}'] = _.template(\"#{escape_javascript data}\");"
    
    [JST_START, SETUP_NAMESPACE, template, JST_END].join("\n")
  end
  
end