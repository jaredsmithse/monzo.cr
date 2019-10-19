class Balance
  include JSON::Serializable

  @[JSON::Field(key: "balance")]
  property balance_cents : Int64

  @[JSON::Field(key: "total_balance")]
  property total_balance_cents : Int64

  @[JSON::Field(key: "balance_including_flexible_savings")]
  property balance_including_flexible_savings_cents : Int64

  property currency : String

  @[JSON::Field(key: "spend_today")]
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
