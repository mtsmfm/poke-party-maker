module TypeChart
  module_function

  def rate(attacking, damaged)
    rate_table[attacking][damaged]
  end

  def list
    rate_table.keys
  end

  def rate_table
    unless @rate_table
      hash = YAML.load_file(Rails.root.join('config/type_chart.yml'))
      hash.values.each {|v| v.default = 1.0 }
      @rate_table = hash.with_indifferent_access
    end

    @rate_table
  end
end
