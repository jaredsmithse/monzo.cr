class Balance
  include JSON::Serializable

  @[JSON::Field(key: "balance")]
  # The currently available balance of the account, as an 64bit integer in minor
  # units of the currency, eg. pennies for GBP, or cents for EUR and USD.
  property balance_cents : Int64

  @[JSON::Field(key: "total_balance")]
  # The sum of the currently available balance of the account and the combined
  # total of all [the user’s pots](https://monzo.com/docs/#list-pots).
  property total_balance_cents : Int64

  @[JSON::Field(key: "balance_including_flexible_savings")]
  property balance_including_flexible_savings_cents : Int64

  # The ISO 4217 currency code.
  property currency : String

  @[JSON::Field(key: "spend_today")]
  # The amount spent from this account today (considered from approx 4am
  # onwards), as a 64bit integer in minor units of the currency.
  property spend_today_cents : Int64

  property local_currency : String
  property local_exchange_rate : Int64
  property local_spend : Array(Int64)

  def balance
    @balance_cents / 100
  end

  def total_balance
    @total_balance_cents / 100
  end

  def balance_including_flexible_savings
    @balance_including_flexible_savings_cents / 100
  end

  def spend_today
    @spend_today_cents / 100
  end
end
