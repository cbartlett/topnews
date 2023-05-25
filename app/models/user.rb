class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Relationships
  has_many :user_articles
  has_many :articles, through: :user_articles

   # Validations
   validates_presence_of :first_name, :last_name, :email, :password
      
end

