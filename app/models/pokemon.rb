class Pokemon < ActiveRecord::Base
  belongs_to :poke_datum

  delegate :name, :to => :poke_datum, allow_nil: true
end
