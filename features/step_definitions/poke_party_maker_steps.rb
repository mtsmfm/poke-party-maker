def ja_type_to_symbol(ja_type)
  Pokemon.type1.values.find {|v| v.text == ja_type }
end

前提(/^使用可能なポケモンは以下のポケモンだけである:$/) do |table|
  table.hashes.each do |row|
    create :pokemon,
      name: row['名前'],
      type1: ja_type_to_symbol(row['タイプ1']),
      type2: ja_type_to_symbol(row['タイプ2']),
      available_in_rating: row['種別'] != '禁止',
      final: row['最終進化'] == 'o'
  end
end

前提(/^パーティ作成画面を表示している$/) do
  visit '/trial_parties/new'
end

前提(/^パーティ一覧画面を表示している$/) do
  visit '/'
end

前提(/^以下の作成済みのパーティがある:$/) do |table|
  @party = create(:party)

  table.hashes.each do |row|
    pokemon = create(
      :pokemon,
      name: row['名前'],
      type1: ja_type_to_symbol(row['タイプ1'])
    )

    @party.pokemons << pokemon
  end
end

もし(/^"(.*?)"に"(.*?)"を入力する$/) do |field, str|
  fill_in field, with: str
end

もし(/^"(.*?)"ボタンをクリックする$/) do |button|
  click_button button
end

もし(/^以下のポケモンを入力する:$/) do |table|
  table.raw.each.with_index(1) do |raw, i|
    fill_in "ポケモン#{i}", with: raw.first
  end
end

ならば(/^以下のポケモンがパーティに含まれていること:$/) do |table|
  table.raw.each do |row|
    pokemon_name = row.first
    page.should have_content(pokemon_name)
  end
end

ならば(/^以下のポケモンのうち"(.*?)"がパーティに含まれていること:$/) do |pokemon_count, table|
  table.raw.count {|raw|
    pokemon_name = raw.first
    page.has_content?(pokemon_name)
  }.should eq pokemon_count.to_i
end

ならば(/^パーティ作成画面を表示していること$/) do
  current_path.should eq '/parties/new'
end

ならば(/^エラーが"(.*?)"であること$/) do |error_count|
  error_count = error_count.to_i
  if error_count == 1
    page.should have_content('1 error')
  else
    page.should have_content("#{error_count} errors")
  end
end

ならば(/^"(.*?)"と表示されること$/) do |message|
  page.should have_content(message)
end

ならば(/^以下のパーティが表示されていること:$/) do |expected_table|
  table = find('table').all('tr').map { |row| row.all('th, td').map { |cell| cell.text.strip } }
  expected_table.diff! table
end

前提(/^そのパーティの詳細画面を表示している$/) do
  visit url_for(@party)
end

ならば(/^以下の相性表が表示されていること:$/) do |expected_table|
  table_elem = find('table')

  types  = table_elem.all('td:first').map(&:text)
  values = table_elem.all('td:last').map(&:text)

  table = [types, values].transpose

  expected_table.diff! table
end
