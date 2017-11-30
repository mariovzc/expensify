# == Schema Information
#
# Table name: expenses
#
#  id                  :integer          not null, primary key
#  concept             :string
#  date                :date
#  amount              :decimal(, )
#  category_id         :integer
#  transaction_type_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :transaction_type

  validates :concept, :date, :category_id, :transaction_type_id , presence: true
  validates :amount, numericality: true, presence: true

  def self.search(transaction_type_id: nil, category_id: nil, month: nil, year: nil)
    with_transaction_type_id(transaction_type_id)
      .with_category_id(category_id)
      .with_month(month)
      .with_year(year)  
  end
  scope :with_transaction_type_id, proc { |transaction_type_id|
    if transaction_type_id.present?
      where(transaction_type_id: transaction_type_id)
    end
  }
  scope :with_category_id, proc { |category_id|
    if category_id.present?
      where(category_id: category_id)
    end
  }
  scope :with_month, proc { |month| 
    if month.present?
      where('extract(month  from date) = ?', month)
    end
  }
  scope :with_year, proc { |year| 
  if year.present?
    where('extract(year  from date) = ?', year)    
  end
}
end
