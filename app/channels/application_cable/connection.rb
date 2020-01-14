module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      if current_user
        logger.add_tags 'ActionCable', current_user.email
        logger.add_tags 'ActionCable', current_user.id
      end
    end

    protected

    def find_verified_user
      env['warden'].user
    end
  end
end
