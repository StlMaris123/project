class Assignment < ApplicationRecord
validates :title, presence: true
validates_format_of :link, :with => URI.regexp, allow_blank: true
end
