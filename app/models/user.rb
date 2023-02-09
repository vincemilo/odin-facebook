# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Gravtastic
  gravtastic

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: %i[facebook]

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

  has_many :friend_sent, class_name: 'Friendship',
                         foreign_key: 'sent_by_id',
                         inverse_of: 'sent_by',
                         dependent: :destroy

  has_many :friend_request, class_name: 'Friendship',
                            foreign_key: 'sent_to_id',
                            inverse_of: 'sent_to',
                            dependent: :destroy

  #   has_many :friends, -> { merge(Friendship.friends) },
  #            through: :friend_sent, source: :sent_to

  #   has_many :pending_requests, -> { merge(Friendship.not_friends) },
  #            through: :friend_sent, source: :sent_to

  #   has_many :received_requests, -> { merge(Friendship.not_friends) },
  #            through: :friend_request, source: :sent_by

  has_many :notifications, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
end
