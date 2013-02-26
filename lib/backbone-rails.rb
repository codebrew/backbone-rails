require 'rails'

module BackboneRails
  class << self
    # Returns true if `BackboneRails` is set to produce coffeescript,
    # false if it is set to produce javascript.
    def coffeescript?
      if @coffeescript.nil?
        detect_script!
      else
        @coffeescript
      end
    end

    # Forces generators to produce coffeescript instead of javascript.
    def coffeescript!
      @coffeescript = true
    end

    # Forces generators to produce javascript instead of coffeescript.
    def javascript!
      @coffeescript = false
    end

    # Sets `BackboneRails` to produce CoffeeScript if the `coffee-script`
    # gem is available, JavaScript otherwise.
    def detect_script!
      @coffeescript = coffeescript_available?
    end

    # Returns true if the `coffee-script` gem is available.
    def coffeescript_available?
      defined?(CoffeeScript) || require('coffee-script')
      true
    rescue LoadError
      false
    end
  end

  class Engine < Rails::Engine
  end
end
