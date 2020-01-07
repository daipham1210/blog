class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: %i[site_admin demo_admin third_admin], multiple: true)                ##
  ############################################################################################ 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:github]


  validates_presence_of :name

  has_many :comments, dependent: :destroy
  acts_as_commontator

  def first_name
    name.split.first
  end

  def last_name
    name.split.last
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.info.nickname).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.info.nickname
      user.email    = auth.info.email
      user.name     = auth.info.name
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
