class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  strip_attributes

  def to_param
    "#{id} #{to_s}".truncate(100).parameterize
  end
end
