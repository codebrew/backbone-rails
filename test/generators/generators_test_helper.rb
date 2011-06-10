module GeneratorsTestHelper
  def self.included(base)
    base.class_eval do
      destination File.expand_path("../tmp", File.dirname(__FILE__))
      setup :prepare_destination
    end
  end
  
  def backbone_path
    "app/assets/javascripts/backbone"
  end
  
end
