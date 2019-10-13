module Locales
  class US
    include JSON::Serializable

    property account_number : String
    property routing_number : String
  end
end
