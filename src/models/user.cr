require "crypto/bcrypt/password"

class User < Granite::Base
  adapter mysql
  table_name users

  # id : Int64 primary key is created for you
  field username : String
  field encrypted_password : String
  field cryptokey : String
  timestamps

  def password=(password)
    self.encrypted_password = Crypto::Bcrypt::Password.create(password, cost: 10).to_s
  end

  def authenticate(password : String)
    if encrypted = self.encrypted_password
      bcrypt_password = Crypto::Bcrypt::Password.new(encrypted)
      bcrypt_password == password
    else
      false
    end
  end
end
