class User < ActiveRecord::Base
  has_many :dreams, dependent: :destroy
  validates :name, :age, :city, :state, presence: true
  validates_inclusion_of :age, :in => 0..99
end
