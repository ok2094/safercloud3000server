class User < Granite::ORM::Base
  adapter mysql
  table_name users


  # id : Int64 primary key is created for you
  field username : String
  field password : String
  field cryptokey : String
  timestamps
end
