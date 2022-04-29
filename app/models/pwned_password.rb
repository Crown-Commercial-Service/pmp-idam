class PwnedPassword < ApplicationRecord
  def self.password_pwned?(password)
    exists?(password: password)
  end
end
