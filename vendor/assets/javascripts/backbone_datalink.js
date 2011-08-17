(function($) {
  return $.extend($.fn, {
    backboneLink: function(model) {
      return $(this).find(":input").each(function() {
        var el, name;
        el = $(this);
        name = el.attr("name");
        model.bind("change:" + name, function() {
          val = model.get(name)
          if ( el.is("input[type='checkbox']") && (val == true || val == false) )
            el.prop('checked', val);
          return el.val(val);
        });
        return $(this).bind("change", function() {
          var attrs;
          el = $(this);
          attrs = {};
          if ( el.is("input[type='checkbox']") )
            attrs[el.attr("name")] = el.prop('checked');
          else
            attrs[el.attr("name")] = el.val();
          return model.set(attrs);
        });
      });
    }
  });
})(jQuery)