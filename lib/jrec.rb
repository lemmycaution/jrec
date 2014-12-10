require "jrec/version"
require "jrec/paths"
require "jrec/pg"
require "jrec/collection"
require "jrec/model"

module Jrec
  extend PG
  include Paths
  def self.gem_root
    @@gem_root ||= File.expand_path('../../', __FILE__)
  end
end
