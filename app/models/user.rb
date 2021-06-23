class User < ApplicationRecord
    has_many :reviews
    has_many :products, through: :reviews

    has_secure_password

    validates_uniqueness_of :email
    validates_presence_of :email, :password, :first_name, :last_name, :age, :skin_type
    validates_length_of :password, in: 8..40
end
