(function($) {
  return $.extend($.fn, {
    backboneLink: function(model) {
      return $(this).find(":input").each(function() {
        var el, name, chng = 'change';
        el = $(this);
        name = el.attr("name");
        model.bind(chng + ":" + name, function onModelChange() {
          return el.val(model.get(name));
        });
        return $(this).bind(chng, function onAttrChange() {
          var attrs;
          el = $(this);
          attrs = {};
          attrs[el.attr("name")] = el.val();
          return model.set(attrs);
        }).trigger(chng);
      });
    }
  });
})(jQuery);
