class Pokemon < ActiveRecord::Base
  extend Enumerize

  RATIO_TABLE = YAML.load_file(Rails.root.join('config/type_chart.yml')).with_indifferent_access.tap {|hash|
    hash.values.each {|v| v.default_proc = (-> (h, k) { 1.0 if RATIO_TABLE.key?(k) }) }
  }.freeze
  TYPES = RATIO_TABLE.keys.freeze

  scope :available_in_rating, -> { where available_in_rating: true }
  scope :final, -> { where final: true }

  enumerize :type1, in: TYPES
  enumerize :type2, in: TYPES

  def compatibilities
    defending_ratios.map {|k, v| [k, contribution(v)] }.to_h.with_indifferent_access
  end

  def defending_ratios
    Pokemon.type1.values.each_with_object(HashWithIndifferentAccess.new) {|k, h|
      h[k] = RATIO_TABLE[k][type1]
      h[k] *= RATIO_TABLE[k][type2] if type2
    }
  end

  private

  def contribution(ratio)
    case ratio
    when 0..0.25 then 1.0
    when 0.5     then 0.7
    when 1       then 0.0
    when 2       then -0.6
    when 4       then -0.8
    end
  end
end
