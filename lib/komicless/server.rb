require 'rack'
require 'haml'

module Komicless

  INDEX_HAML = open( File.expand_path "index.haml", File.dirname(__FILE__) ).read.freeze
  INDEX = ::Haml::Engine.new INDEX_HAML, { :attr_wrapper => '"' } # or there will be ' in filenames

  class Server < ::Rack::Directory

    # remove first entry
    def list_directory
      ret = super
      # @files = [ url, basename, size, type, mtime ]
      @files.shift
      ret
    end

    # display filesize in integer
    def filesize_format(int)
      int
    end

    # render with our HAML template
    def each
      page = INDEX.render(scope=Object.new, locals={ :files => @files } )
      page.each_line{|l| yield l }
    end

  end

end
