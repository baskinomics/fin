module Accounting

import Dates

using Dates

abstract type Asset end
abstract type Cash <: Asset end
abstract type BankAccount <: Cash end
abstract type PersonalProperty <: Asset end
abstract type InvestedAssets <: Asset end

"""
A liability is a present obligation of an individual arising from past events,
the settlement of which is expected to result in an outflow from the individual
of resources embodying economic benefits.
"""
abstract type Liability end

"An outflow of cash or other assets from an individual to another entity."
abstract type Expenditure end

"Represents an individual's liquid cash."
struct LiquidCash <: Cash end

"Represents a checking account at a financial institution."
struct CheckingAccount <: BankAccount end

"Represents a savings account at a financial institution."
struct SavingsAccount <: BankAccount end

"Represents a budgeted expense."
struct BudgetExpense <: Expenditure
    amount::Float64
    category::String
    due::Date
    # weight::Int16
end

export BudgetExpense, Expenditure

end
