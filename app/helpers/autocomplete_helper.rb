module AutocompleteHelper
  def pokemon_autocomplete(target, appended)
    source = PokeDatum.pluck(:name)
    javascript_tag { "setAutocomplete('#{target}', '#{appended}', #{source.inspect})".html_safe }
  end
end
