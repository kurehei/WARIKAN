class Travel < ApplicationRecord
  belongs_to :user
  has_many :members, dependent: :destroy

  def sum_content
    self.map { |content| content.amount}
     raise amount.inspect
    @amount = amount.inject {|num, sum| 
    num = sum + num
   }
  end
end
