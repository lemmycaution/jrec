require 'oj'
require 'uri'

class ::String
  def to_json
    self
  end
  def as_json
    Oj.load(self)
  end
end