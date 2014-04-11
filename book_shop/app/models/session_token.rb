class SessionToken < ActiveRecord::Base
  SECRET = "Citic.2014"

  attr_accessible :digest, :secret, :token
  before_create :generate_token

private

  def generate_token
    self.token = SecureRandom.hex
    self.digest = Digest::SHA512.hexdigest("#{secret}:#{self.token}:SECRET")
  end
end
