require 'rack'
require 'erb'

module Komicless

  INDEX_ERB = open( File.expand_path "index.html.erb", File.dirname(__FILE__) ).read.freeze
  INDEX = ::ERB.new INDEX_ERB

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

    # render with our template
    def each
      page = INDEX.result binding
      # strip space. This regex from http://stackoverflow.com/a/8828408/327815
      page.gsub!(%r%(?<=[\^])\t{2,}|(?<=[>])\s{2,}(?=[<])|(?<=[>])\s{2,11}(?=[<])|(?=[\n])\s{2,}%,"")
      page.each_line{|l| yield l }
    end

  end

end
