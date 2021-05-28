class Restaurant < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owenr_id"
  has_many :foods
  has_many :restaurant_users
  has_many :users, through: :restaurant_users
  has_many :promos
  has_many :vouchers
  has_many :restaurant_rating_users
  has_many :notifications
end
