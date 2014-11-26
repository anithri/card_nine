require 'facets/string/pathize'
require 'facets/string/camelcase'
class NewMethod < Thor::Group
  include Thor::Actions

  # Define arguments and options
  argument :name

  def self.source_root
    File.dirname(__FILE__)
  end

  def create_lib_file
    file_name = name.pathize
    parts     = name.split('::')
    create_file "lib/#{file_name}.rb" do
      out = ''
      parts.each_with_index do |part, i|
        keyword = (i == parts.length - 1) ? 'class' : 'module'
        indent  = '  ' * i
        out     += indent + keyword + ' ' + part.camelcase(:upper) + "\n"
      end
      parts.length.times do |i|
        indent = '  ' * (parts.length - i - 1)
        out    += "#{indent}end\n"
      end
      out
    end
  end

  def create_spec_file
    file_name = name.pathize
    create_file "spec/#{file_name}_spec.rb" do
      "require 'rspec'\nrequire '#{file_name}'\n\ndescribe #{name} do\n\nend\n"

    end
  end
end

