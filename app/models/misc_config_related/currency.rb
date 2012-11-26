class Currency < ActiveRecord::Base
  attr_accessible :abbr, :locale_abbr

  #TODO
  def convert(amount, to_currency)
    amount
  end
end
