require "jwt"

class Auth

  def self.generate(payload)
    JWT.encode(payload, Amber.settings.secret_key_base, "HS256")
  end

  def self.decode(token)
    JWT.decode(token, Amber.settings.secret_key_base, "HS256")
  end
end
