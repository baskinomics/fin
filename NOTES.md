# Notes

* Possible integration w/ [Plaid](https://plaid.com/) in future roadmap.
* See [Julia + TOML](https://discourse.julialang.org/t/best-way-to-create-config-files-does-julia-support-toml-natively/21415)

## Resources
* [BYU Personal Finance](https://personalfinance.byu.edu/helpingothers)
* [Missouri State - Personal Financial Plan](https://web.archive.org/web/20150917050157/http://www.missouristate.edu/assets/reallife/Creating_a_Personal_Financial_Plan.pdf)

## Gloassary of Terms
* [Income](https://en.wikipedia.org/wiki/Income)

## Process
- [ ] ETL
  - [ ] Transactions
    * Download
    * Sanitize
    * Categorization
  - [ ] Budget (TOML)
    * Credit Cards
    * Loans
    * Medical
- [ ] Report Generation (`Data -> Markdown -> PDF`)
  - [ ] [`Weave.jl`](http://weavejl.mpastell.com/stable/)

### Transactions
- [ ] Download 
- [ ] Sanitize
- [ ] Categorize

### Budget
- [ ] Design specification
- [ ] Domain modeling

## Concepts

### Budget
Allocated vs actual.

* Income(s)
* Expenses

#### Income
(Monthly)

#### Expenses
* Utilities
  * Phone
  * Internet
  * Electric
  * Gas
  * Water
  * Sewage
* Bills
  * Rent
  * Debt
  * Savings
  * Medical (Copays, Deductible, Prescriptions)
  * Insurance
    * Health
    * Vision
    * Dental
    * Auto
    * Renters
* General Expenses
  * Animal
  * Groceries
  * Vehicle (Gas)
  * Subscriptions
  * Gym Membership

## Reports
* [Income Statement](https://en.wikipedia.org/wiki/Income_statement)
* [Balance Sheet](https://en.wikipedia.org/wiki/Balance_sheet)
* [Amortization Schedule](https://en.wikipedia.org/wiki/Amortization_schedule)

### Metrics
| Metric | Description |
| ------ | ----------- |
| [Consumer Leverage Ratio](https://en.wikipedia.org/wiki/Consumer_leverage_ratio) | the ratio of total household debt to disposable personal income |
| [Expenditures (Monthly)](https://en.wikipedia.org/wiki/Expense) | Expenditure is an outflow of money to another person or group to pay for an item or service, or for a category of costs.  |
| [Equity](https://en.wikipedia.org/wiki/Equity_(finance)) | todo |
| [Assets](#) | Income, savings, vehicle, etc |
| [Liabilities](#) | Debts (loans, credit cards, medical) |
| [Purchase goals](#) | Progress towards purchase goals |
