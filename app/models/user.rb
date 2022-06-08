class User < ApplicationRecord
    has_secure_password

    enum authority: { Master: '1', Admin: '2', Customer: '3' }

    PASSWORD_FORMAT = /\A
    (?=.{8,})          # Must contain 8 or more characters
    (?=.*\d)           # Must contain a digit
    (?=.*[a-z]|[A-Z])        # Must contain a lower case character
    /x


    validates :email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
    validates :password_digest, presence: true, confirmation: true, length: {minimum: 8, maximum: 20}, format: { with: PASSWORD_FORMAT }
    validates :authority, inclusion: { in: ['Admin', 'Customer'] } 

end
