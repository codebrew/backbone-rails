extensions =
  backboneLink: (model) ->
    $(this).find('input,select,textarea').each ->
      el = $(this)
      name = el.attr 'name'
      model.bind "change:#{name}", ->
        el.val(model.get('name'))
      el.on 'change', ->
        attrs = {}
        attrs[el.attr('name')] = el.val()
        model.set attrs


$.extend $.fn, extensions
