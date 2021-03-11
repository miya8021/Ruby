class BonusDrink
  #selfはクラスメソッドを使用している
  def self.total_count_for(amount)
    #自身がゼロの時trueを返す
    if amount.zero?
      0
    #奇数であればtrue
    elsif amount.odd?
      3 * amount / 2
    #偶数であればtrue
    elsif amount.even?
      3 * (amount - 1) / 2 + 1
    end
  end
end
puts BonusDrink.total_count_for 100


class BonusDrink
  def self.total_count_for(amount)
    #returnした場合はプログラムは終了する
    return 0 if amount.zero?

    # 偶数のとき
    if amount.even?
      3 * (amount - 2) / 2 + 2
    # 奇数のとき
    elsif amount.odd?
      3 * (amount - 1) / 2 + 1
    end
  end
end
puts BonusDrink.total_count_for 100
