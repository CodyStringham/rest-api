class User < ActiveRecord::Base
  has_many :dreams, dependent: :destroy
end
