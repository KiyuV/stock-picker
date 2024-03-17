def stock_picker(stock_data)
  sell = -1
  buy = 0
  profit = -1

  #reversing the data until n - 1 will help resolve selling on the first day
  stock_data.reverse[0..-2].each_with_index do |s_day, s_ind|
    stock_data.reverse[s_ind+1..-1].each_with_index do |b_day, b_ind|
      current_profit = profit(s_day, b_day)
      if (current_profit > profit)
        profit = current_profit
        sell = s_day
        buy = b_day
      end
    end
  end
  p [stock_data.index(buy), stock_data.index(sell)]
end

def profit(sell, buy)
  sell - buy
end

stock_picker([17,3,6,9,15,8,6,1,10]) #[1, 4] profit = $12
stock_picker([13,3,2,15,4,8,10,20,6,14]) #[2, 7] profit = $18