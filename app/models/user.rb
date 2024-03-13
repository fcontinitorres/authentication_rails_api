class User < ApplicationRecord
	## Gem instruction
	has_secure_password 	## define que password deve ser criptografado

	validates_presence_of :email
	validates_uniqueness_of :email
end
