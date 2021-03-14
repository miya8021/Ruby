require 'minitest/autorun'

def split_price(price_text)
  #nil?の判定
  # if price_text.nil? then ['', '']
  # elsif price_text == '価格未定' then ['価格未定', '']
  # elsif price_text.include?('万円') then [price_text.delete('万円'), '万円']
  # elsif price_text.include?('円') then [price_text.delete('円'), '円']
  # end
  # 正規表現オブジェクトを作成（「万」でも「円」でもない文字が1つ以上続く文字列（[^万円]+））
  # 「円」または「万円」（万?円）
  regex = /([^万円]+)(万?円)/
  # matchメソッドは引数に正規表現を指定して、マッチした文字列を取得したいときに使用。||演算子は、左から右へ順に式を評価し、真だったものを返します。
  regex.match(price_text).to_a[1..2] || [price_text.to_s, '']
end
#describeにはテスト対象をかく
describe 'split_price' do
  let(:manyen) { '110.0万円' }
  let(:yen) { '2015円' }
  let(:comma) { '1,123,456円' }
  let(:hyphen) { '110 - 120万円' }
  let(:zenkaku) { '２０１５円' }
  let(:jponly) { '価格未定' }
  let(:blank) { nil }

  it { split_price(manyen).must_equal ['110.0', '万円'] }
  it { split_price(yen).must_equal %W[2015 \u5186] }
  it { split_price(comma).must_equal ['1,123,456', '円'] }
  it { split_price(hyphen).must_equal ['110 - 120', '万円'] }
  it { split_price(zenkaku).must_equal %W[\uFF12\uFF10\uFF11\uFF15 \u5186] }
  it { split_price(jponly).must_equal ['価格未定', ''] }
  it { split_price(blank).must_equal ['', ''] }
end