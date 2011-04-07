class Bookmark < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :url
end
