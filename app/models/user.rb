class User < ApplicationRecord
  belongs_to :account, optional: true
  encrypts :password, :password_confirmation
end
