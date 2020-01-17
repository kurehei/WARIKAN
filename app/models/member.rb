class Member < ApplicationRecord
  belongs_to :travel
  has_many :contents, dependent: :destroy
end
