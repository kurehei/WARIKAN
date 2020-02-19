class Content < ApplicationRecord
  belongs_to :member

  def sum_content
    contents.map { |content| content.amount}
     raise amount.inspect
    @amount = amount.inject {|num, sum| 
    num = sum + num
   }
  end
  # 配列でデータを格納する
  serialize :average_amount, Array 

  
  
end
