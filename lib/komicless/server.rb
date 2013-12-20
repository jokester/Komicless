require 'rack'
require 'erb'
require 'socket'

module Komicless

  INDEX_ERB = open( File.expand_path "index.html.erb", File.dirname(__FILE__) ).read.freeze
  INDEX = ::ERB.new INDEX_ERB

  def self.each_nic
    # enumerate IPaddr of NICs
    count = 0
    Socket::getaddrinfo(Socket.gethostname,"http", nil, :STREAM).each do |family, port, hostname, ip, *_|
      count+=1
      yield count, ip[/^[^%]*/]
    end
  end

  class Server < ::Rack::Directory

    def self.create app_options
      self.new( app_options[:root] )
    end

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
