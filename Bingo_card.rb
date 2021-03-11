class Bingo
  def self.generate_card
    #*をつけることで（）を展開/()の範囲オブジェクトを配列に変換/
    # take(5)で1〜15のシャッフルした数値の中から5つ配列として出力
    b = ['B', *(1..15).to_a.shuffle.take(5)]
    i = ['I', *(16..30).to_a.shuffle.take(5)]
    n = ['N', *(31..45).to_a.shuffle.take(5)]
    g = ['G', *(46..60).to_a.shuffle.take(5)]
    o = ['O', *(61..75).to_a.shuffle.take(5)]
    # rjust(2)で2の幅の文字列を右詰めで表示
    cols = [b, i, n, g, o].map { |array| array.map { |s| s.to_s.rjust(2) } }
    #2x3のマスに空欄を代入する
    cols[2][3] = '  '
    #行と列を入れ替える
    rows = cols.transpose
    # 配列.join(区切りの文字列)\nで改行を代入
    rows.map { |array| array.join(' | ') }.join("\n")
  end
end
puts Bingo.generate_card