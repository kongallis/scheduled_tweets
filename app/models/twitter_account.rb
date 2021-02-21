class TwitterAccount < ApplicationRecord
  has_many :tweets, dependent: :destroy
  belongs_to :user

  validates :username, uniqueness: true

  def client
    client = Twitter::REST::Client.new do |config|
      # These are taken from the Rails credentials
      config.consumer_key        = Rails.application.credentials.dig(:twitter, :api_key)
      config.consumer_secret     = Rails.application.credentials.dig(:twitter, :api_secret)

      # These are taken from the database
      config.access_token        = token
      config.access_token_secret = secret
    end
  end
end
