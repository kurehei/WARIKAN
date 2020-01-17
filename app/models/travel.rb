class Travel < ApplicationRecord
  belongs_to :user
  has_many :contents, dependent: :destroy
  has_many :members, dependent: :destroy
end
