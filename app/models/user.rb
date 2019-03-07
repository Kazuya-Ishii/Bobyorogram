class User < ApplicationRecord
  validates :name, presence: true, length: {maximum:15 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }


 has_secure_password
 validates :password, length: { minimum:8, maximum:32 },
 format: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

 has_many :topics
 has_many :favorites, dependent: :destroy
 has_many :favorite_topics, through: :favorites, source: 'topic'
end
