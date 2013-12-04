require "sinatra"

module Komicless
  INDEX_HAML = open( File.expand_path "../index.haml", __FILE__ ).read.freeze

end
