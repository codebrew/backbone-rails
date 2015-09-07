(function($) {
  Backbone._sync = Backbone.sync;

  Backbone.sync = function(method, model, options) {
    if (!options.noCSRF) {
      var beforeSend = options.beforeSend;

      // Set X-CSRF-Token HTTP header
      options.beforeSend = function(xhr) {
        var token = $('meta[name="csrf-token"]').attr('content');
        if (token) xhr.setRequestHeader('X-CSRF-Token', token);
        if (beforeSend) return beforeSend.apply(this, arguments);
      };
    }

    // Serialize data, optionally using paramRoot
    if (options.data == null && model && (method === 'create' || method === 'update' || method === 'patch')) {
      options.contentType = 'application/json';
      var attributes = options.attrs || model.toJSON(options);
      var data;
      if (model.paramRoot) {
        data = {};
        data[model.paramRoot] = attributes;
      } else {
        data = attributes;
      }
      options.data = JSON.stringify(data);
    }

    return Backbone._sync(method, model, options);
  };

})(jQuery);