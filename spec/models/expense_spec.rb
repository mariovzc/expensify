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

require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:category) { Category.create( name: 'transaction_type' )}
  let(:transaction_type) { TransactionType.create( name: 'transaction_type' )}
  subject { described_class.new(
    concept: 'Comida',
    date: Date.parse('2016-08-20'),
    amount: 20000,
    category: category,
    transaction_type: transaction_type
    )}
  
  it "is valid" do
    expect(subject).to be_valid
  end

  it "is not valid without a concept" do
    subject.concept = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a date" do
    subject.date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a amount" do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it "should have a category" do
    subject.category = nil
    expect(subject).to_not be_valid    
  end

  it "should have a transaction_type" do
    subject.transaction_type = nil
    expect(subject).to_not be_valid    
  end

  it "should belongs to category" do
    t = described_class.reflect_on_association(:category)
    expect(t.macro).to eq(:belongs_to)
  end
  it "should belongs to transaction_type" do
    t = described_class.reflect_on_association(:transaction_type)
    expect(t.macro).to eq(:belongs_to)
  end

end
