# == Schema Information
#
# Table name: transaction_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TransactionType < ApplicationRecord
  validates :name, presence: true
  #has_many :expenses
end
