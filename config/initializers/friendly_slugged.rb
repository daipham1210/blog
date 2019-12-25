module FriendlyId
  module Slugged
    def normalize_friendly_id(value)
      I18n.transliterate(value.to_s, locale: :vi).parameterize
    end
  end
end
