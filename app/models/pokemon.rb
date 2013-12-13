class Pokemon < ActiveRecord::Base
  RATIO_TABLE = YAML.load_file(Rails.root.join('config/type_chart.yml')).tap {|h|
    h.values.each {|v| v.default = 1.0; v.freeze }
  }.freeze
  TYPES = RATIO_TABLE.keys.freeze

  scope :available_in_rating, -> { where available_in_rating: true }
  scope :final, -> { where final: true }

  def compatibilities
    defending_ratios.map {|k, v| [k, contribution(v)] }.to_h
  end

  def defending_ratios
    RATIO_TABLE.keys.each_with_object({}) {|k, h|
      h[k.to_sym] = RATIO_TABLE[k][type1]
      h[k.to_sym] *= RATIO_TABLE[k][type2] if type2
    }
  end

  private

  def contribution(ratio)
    case ratio
    when 0..0.25 then 5
    when 0.5     then 4
    when 1       then 3
    when 2       then 2
    when 4       then 1
    end
  end
end
