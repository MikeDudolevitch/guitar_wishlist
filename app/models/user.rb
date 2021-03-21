class User < ActiveRecord::Base
    has_many :guitars
    has_secure_password
end