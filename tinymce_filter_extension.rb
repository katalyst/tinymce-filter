# Uncomment this if you reference any of your controllers in activate
require_dependency 'application'

class TinymceFilterExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/tinymce_filter"
  
  define_routes do |map|
    map.connect 'admin/tinymce_filter_images/:action', :controller => 'admin/tinymce_filter_images'
  end
  
  def activate
    # Load the filter
    TinymceFilter
    
    
    # Add the appropriate stylesheets to the javascripts array in the page and snippet controller
    Admin::PageController.class_eval do
      before_filter :add_tinymce_javascripts, :only => [:edit, :new]
      
      def add_tinymce_javascripts
        @javascripts << 'extensions/tinymce_filter/tiny_mce' << 'extensions/tinymce_filter/tiny_mce_settings'
      end
      
    end
    
    Admin::SnippetController.class_eval do
      before_filter :add_tinymce_javascripts, :only => [:edit, :new]
      
      def add_tinymce_javascripts
        @javascripts << 'extensions/tinymce_filter/tiny_mce' << 'extensions/tinymce_filter/tiny_mce_settings'
      end
      
    end
    
  end
  
  def deactivate
  end
  
end