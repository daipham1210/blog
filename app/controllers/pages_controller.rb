class PagesController < ApplicationController
  layout 'about'
  def about
    @page_title = 'My Portfolio'
  end
end
