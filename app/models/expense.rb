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
end
