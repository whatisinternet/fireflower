require 'active_support/inflector'

require 'thermite/fiddle'

class Case
  def ruby_to_snake_case(non_snake_cased_string = "")
    non_snake_cased_string.to_s.underscore
  end

  def ruby_to_camel_case(non_camel_cased_string = "")
    non_camel_cased_string.to_s.camelize
  end

  def ruby_to_pascal_case(non_pascal_cased_string = "")
    non_pascal_cased_string.to_s.camelize
  end

  def to_snake_case(non_snake_cased_string = "")
    _to_snake_case(non_snake_cased_string.to_s)
  end

  def to_camel_case(non_camel_cased_string = "")
    _to_camel_case(non_camel_cased_string.to_s)
  end

  def to_pascal_case(non_pascal_cased_string = "")
    _to_pascal_case(non_pascal_cased_string.to_s)
  end
end

toplevel_dir = File.dirname(File.dirname(__FILE__))
Thermite::Fiddle.load_module('init_fireflower',
                             cargo_project_path: toplevel_dir,
                             ruby_project_path: toplevel_dir)
