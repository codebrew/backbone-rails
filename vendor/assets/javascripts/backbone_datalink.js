(function($) {
  $.fn.isCheckable = function() {
    return ["checkbox", "radio"].indexOf(this.attr("type")) >= 0;
  };
  return $.extend($.fn, {
    backboneLink: function(model) {
      return $(this).find(":input").each(function() {
        var el, name;
        el = $(this);
        name = el.attr("name");
        model.bind("change:" + name, function() {
          if (el.isCheckable()) {
            return el.prop("checked", model.get(name));
          } else {
            return el.val(model.get(name));
          }
        });
        return $(this).bind("change", function() {
          var attrs;
          el = $(this);
          attrs = {};
          if (el.isCheckable()) {
            attrs[el.attr("name")] = el.is(":checked");
          } else {
            attrs[el.attr("name")] = el.val();
          }
          return model.set(attrs);
        });
      });
    }
  });
})(jQuery);
