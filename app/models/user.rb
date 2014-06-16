class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :registerable, :confirmable, :rememberable

  has_many :jewelries, through: :ownerships

  validates :username, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: "username can only contain letters and numbers"}
  validates :email, uniqueness: true
end
