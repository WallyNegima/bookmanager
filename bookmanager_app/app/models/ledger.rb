class Ledger < ApplicationRecord
  belongs_to :user
  belongs_to :book

  scope :on_loan, where(returned_at: nil)
end
