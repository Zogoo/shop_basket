class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :lockable, :confirmable, :trackable,
         omniauth_providers: [:facebook]

  mount_uploader :icon, ImageUploader
  enum status: %i[active pending suspended]

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    user ||= User.create(
              uid:        auth.uid,
              provider:   auth.provider,
              email:      auth.info.email,
              first_name: auth.info.name,
              password:   Devise.friendly_token[0, 20],
              icon:      auth.info.image
            )

    user
  end
end
