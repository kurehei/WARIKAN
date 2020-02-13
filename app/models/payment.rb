class Payment < ApplicationRecord
  belongs_to :content
  belongs_to :member
end
