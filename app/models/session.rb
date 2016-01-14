class Session < ActiveRecord::Base
  belongs_to :user, inverse_of: :session

  EXPIRE_TIME = 30.days

  def token_valid?
    created_at > EXPIRE_TIME.ago
  end
end
