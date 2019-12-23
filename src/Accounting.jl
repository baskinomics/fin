module Accouting

abstract type Asset end
abstract type Cash <: Asset end
abstract type BankAccount <: Cash end
abstract type PersonalProperty <: Asset end
abstract type InvestedAssets <: Asset end

abstract type Liability end


struct LiquidCash <: Cash end
struct CheckingAccount <: BankAccount end
struct SavingsAccount <: BankAccount end



end