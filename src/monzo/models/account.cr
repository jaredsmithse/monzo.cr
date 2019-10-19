class Account
  include JSON::Serializable

  property id : String
  property closed : Bool

  @[JSON::Field(converter: Time::Format.new("%F"))]
  property created : Time

  property description : String
  property type : String
  property currency : String
  property country_code : String
  property owners : Array(Owner)
  property payment_details : PaymentDetails

  def balance_details
    Monzo::API::Balance.new.find(id)
  end
end
