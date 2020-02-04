class Member < ApplicationRecord
  belongs_to :travel
  has_many :contents, dependent: :destroy

  def sum_content
    
    contents = self.contents

    amount = contents.map { |content| content.amount}
    
    a = []
    @amount_sum2 = amount.inject {|num, sum| 
    num = sum + num
  }
   #  raise @amount_sum2.inspect
  end
end
