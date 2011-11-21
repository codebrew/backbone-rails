(function($) {
  return $.extend($.fn, {
    backboneLink: function(model) {
      return $(this).find(":input").each(function() {
        var el, name, chng = 'change', attr = 'name';
        el = $(this);
        name = el.attr(attr);
        model.bind(chng + ":" + name, function onModelChange() {
          return el.val(model.get(name));
        });
        return el.bind(chng, function onAttrChange() {
          var attrs;
          el = $(this);
          attrs = {};
          attrs[el.attr(attr)] = el.val();
          return model.set(attrs);
        }).trigger(chng);
      });
    }
  });
})(jQuery);
