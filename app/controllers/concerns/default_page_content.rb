module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = 'Dai Pham Portfolio Website'
    @seo_keywords = 'Dai Pham portfolio'
  end
end