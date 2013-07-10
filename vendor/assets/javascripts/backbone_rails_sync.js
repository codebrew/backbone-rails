(function($) {
  var methodMap = {
    'create': 'POST',
    'update': 'PUT',
    'delete': 'DELETE',
    'read'  : 'GET',
    'patch' : 'PUT'
  };
  
  var getUrl = function(object) {
    if (!(object && object.url)) return null;
    return _.isFunction(object.url) ? object.url() : object.url;
  };
  
  var urlError = function() {
    throw new Error("A 'url' property or function must be specified");
  };

  Backbone.sync = function(method, model, options) {
    var type = methodMap[method];

    // Default JSON-request options.
    var params = _.extend({
      type:         type,
      dataType:     'json',
      beforeSend: function( xhr ) {
        if (!options.noCSRF) {
          var token = $('meta[name="csrf-token"]').attr('content');
          if (token) xhr.setRequestHeader('X-CSRF-Token', token);  
        }
        model.trigger('sync:start');
      }
    }, options);

    if (!params.url) {
      params.url = getUrl(model) || urlError();
    }
    
    
    // Ensure that we have the appropriate request data.
    if (!params.data && model && (method == 'create' || method == 'update' || method == 'patch')) {
      params.contentType = 'application/json';

      var data = {}

      if(model.paramRoot) {
        if(params.attrs)
          data[model.paramRoot] = params.attrs;
        else
          data[model.paramRoot] = model.toJSON();
      } else {
        if(params.attrs)
          data = params.attrs;
        else
          data = model.toJSON();
      }

      params.data = JSON.stringify(data)
    }

    // Don't process data on a non-GET request.
    if (params.type !== 'GET') {
      params.processData = false;
    }

    // Trigger the sync end event
    var complete = options.complete;
    params.complete = function(jqXHR, textStatus) {
      model.trigger('sync:end');
      if (complete) complete(jqXHR, textStatus);
    };
    
    var success = options.success;
    params.success = function(resp) {
      if (success) success(model, resp, options);
      model.trigger('sync', model, resp, options);
    };

    var error = options.error;
    params.error = function(xhr) {
      if (error) error(model, xhr, options);
      model.trigger('error', model, xhr, options);
    };
    
    
    // Make the request.
    return $.ajax(params);
  }
  
})(jQuery);
