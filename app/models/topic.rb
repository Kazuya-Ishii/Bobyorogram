class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :user_id, presence: true
  validates :image, presence: true


  belongs_to :user

  mount_uploader :image, ImageUploader

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites 
  has_many :comments
end
