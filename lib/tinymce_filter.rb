class TinymceFilter < TextFilter
  filter_name "Tinymce"
  description_file File.dirname(__FILE__) + "/../tinymce.html"
  def filter(text)
    text
  end
end