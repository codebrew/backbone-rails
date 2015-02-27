(function() {
  var origSync = Backbone.sync;

  // Define a patched version of Backbone.Model.toJSON that takes into account paramRoot.
  // Note that toJSON is not called when you call save with {patch: true}. So we handle
  // that case elsewhere.
  function wrapToJSON(origToJSON) {
    return function(options) {
      // This is the attributes hash formatted in the Backbone standard way.
      var unwrapped = origToJSON.apply(this, [options]);
      if (this.paramRoot) {
        // For this model, we want to wrap the attributes hash in a parameter name, as
        // expected by Rails.
        var json = {};
        json[this.paramRoot] = unwrapped;
        return json;
      } else {
        // This model doesn't define paramRoot, so we stick with the default
        // Backbone behavior.
        return unwrapped;
      }
    }
  }
  
  
  // Patch Backbone.sync so that it 1) uses the csrf-token, and 2) uses our patched
  // version of toJSON.
  Backbone.sync = function(method, model, options) {
    if (!options.noCSRF) {
      var beforeSend = options.beforeSend;

      // Set X-CSRF-Token HTTP header
      options.beforeSend = function(xhr) {
        var token = jQuery('meta[name="csrf-token"]').attr('content');
        if (token) xhr.setRequestHeader('X-CSRF-Token', token);
        if (beforeSend) return beforeSend.apply(this, arguments);
      };
    }
  
    if (options.attrs) {
      // sync wasn't called with options.attrs. So Model.save was called with
      // {patch: true}.
      if (model.paramRoot) {
        // Wrap options.attrs in paramRoot and pass control to the original Backbone.sync.
        var wrapped = {};
        wrapped[model.paramRoot] = options.attrs;
        options.attrs = wrapped;
      }
      return origSync(method, model, options);
    } else {
      // sync wasn't called with options.attrs. So Model.save wasn't called with
      // {patch: true}.
      // 
      // Temporarily patch Backbone.Model.toJSON so it takes into account paramRoot.
      // Restore the original version of toJSON after we're done.
      var ret;
      try {
        var origToJSON = model.toJSON;
        model.toJSON = wrapToJSON(origToJSON);
        ret = origSync(method, model, options);
      } finally {
        model.toJSON = origToJSON;
      }
    }
  
    return ret;
  };
})();