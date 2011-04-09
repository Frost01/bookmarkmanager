class Bookmark < ActiveRecord::Base
  validates_presence_of :title,
    :message => "Bitte Titel eingeben"
  validates_presence_of :url,
    :message => "Bitte URL eingeben"
end
