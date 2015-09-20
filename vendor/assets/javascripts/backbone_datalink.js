(function($) {
  return $.extend($.fn, {
    backboneLink: function(model) {
      return $(this).find(":input").each(function() {
        var el, name;
        el = $(this);
        name = el.attr("name");
        model.bind("change:" + name, function() {
          if(el.is(":checkbox")){
            return el.attr("checked", !!model.get(name));
          }
          else{
            return el.val(model.get(name));
          }
        });
        return $(this).bind("change", function() {
          var attrs, newValue;
          el = $(this);
          attrs = {};
          newValue = el.is(":checkbox") ? el.is(":checked") : el.val();
          attrs[el.attr("name")] = newValue;
          return model.set(attrs);
        });
      });
    }
  });
})(jQuery);
