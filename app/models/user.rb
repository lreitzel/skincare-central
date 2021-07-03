class User < ApplicationRecord
    has_many :reviews
    has_many :products, through: :reviews

    has_secure_password

    validates_uniqueness_of :email
    validates_presence_of :email, :password, :first_name, :last_name
    validates_length_of :password, in: 6..40

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid]) do |u|
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
            u.first_name = response[:info][:first_name]
            u.last_name = response[:info][:last_name]
        end
    end

end
