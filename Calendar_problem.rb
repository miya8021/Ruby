#Dateクラスは拡張クラスなので、dateライブラリ−を読み込む必要がある
require "date"

# 今日の月と西暦を取得
head = Date.today.strftime('%B %Y')
year = Date.today.year
mon = Date.today.mon

# 今月1日の曜日を取得(0~6)
firstday_wday = Date.new(year, mon, 1).wday
# 今月の最終日を取得
lastday_date = Date.new(year, mon, -1).day
week = %w[Su Mo Tu We Th Fr Sa]

# 月と西暦中央寄せで出力
puts head.center(20)
# スペースを開けてweekの配列を表示
puts week.join(" ")
# printの改行せず表示する特製を使って、1日までの空白を出力
print "   " * firstday_wday


wday = firstday_wday
(1..lastday_date).each do |date| # 1~最終日まで繰り返し
  print date.to_s.rjust(2) + ' ' # 日付を右寄せで表示
  wday += 1
  print "\n" if wday % 7 == 0 # 土曜日まで（7の倍数）表示したら改行
end
print "\n" if wday % 7 != 0
