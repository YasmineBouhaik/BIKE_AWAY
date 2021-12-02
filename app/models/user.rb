class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :itineraries, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :rides, through: :participants

  validates :bio, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :level, presence: true
end
