class Jquery
  extend ActionView::Helpers::JavaScriptHelper
  
  JST_START = "(function(){"
  JST_END = "}).call(this);"
  
  def self.render(name, data)
    template = "jQuery.template(\"#{name}\", \"#{escape_javascript data}\");"
    [JST_START, template, JST_END].join("\n")
  end
  
end
