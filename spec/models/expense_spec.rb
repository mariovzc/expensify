# == Schema Information
#
# Table name: expenses
#
#  id                  :integer          not null, primary key
#  concept             :string
#  expense_date        :date
#  amount              :decimal(, )
#  category_id         :integer
#  transaction_type_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe Expense, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
