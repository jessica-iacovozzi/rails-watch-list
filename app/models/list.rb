class List < ApplicationRecord
  has_many :bookmarks
  has_many :lists
  has_many :movies, through: :bookmarks, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, presence: true
end
