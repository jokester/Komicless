require 'rack'

module Komicless
  INDEX_HAML = open( File.expand_path "index.haml", File.dirname(__FILE__) ).read.freeze
  class Server < ::Rack::Directory
  end

end
