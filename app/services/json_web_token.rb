class JsonWebToken

    SECRET_KEY = ENV['SECRET_KEY']

    def self.encode(payload)
        JWT.encode(payload, SECRET_KEY)
    end
    
    def self.decode(token)
        decoded = JWT.decode(token, SECRET_KEY)[0]
        HashWithIndifferentAccess.new decoded
    end
end
