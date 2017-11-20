# == Schema Information
#
# Table name: transaction_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe TransactionType, type: :model do
  subject { described_class.new(name: 'Purchase') }
  
  it "is valid" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  #it "should have many expenses" do
  #  t = described_class.reflect_on_association(:expenses)
  #  expect(t.macro).to eq(:has_many)
  #end
end
