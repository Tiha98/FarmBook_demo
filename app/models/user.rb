class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cows, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :fields, dependent: :destroy
end
