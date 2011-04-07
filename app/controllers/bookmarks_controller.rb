class BookmarksController < ApplicationController
  def index
    @bookmarks = ["http://www.rubyonrails.com", "http://www.ruby-lang.org"]
  end

  def edit
  end

  def new
  end

end
