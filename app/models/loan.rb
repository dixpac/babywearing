# frozen_string_literal: true

class Loan < ApplicationRecord
  belongs_to :carrier
  belongs_to :lender, class_name: "User", default: -> { Current.user }
  belongs_to :borrower, class_name: "User"
end
