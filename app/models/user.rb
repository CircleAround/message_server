class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  validates :token, presence: true, uniqueness: true

  def self.sign_up!(params)
    user = User.new(params)
    user.token = generate_token
    user.save!
    user
  end

  def self.login!(params)
    user = User.find_by!(email: params[:email])
    user.token = generate_token
    user.save!
    user
  end

  private

  def self.generate_token
    loop do
      token = SecureRandom.hex(length = 16/2)
      return token unless User.find_by(token: token)
    end
  end
end
