# Coin Flipping Statistics in Elixir(definitely better than Erlang)

defmodule Coin do
  @coin_face ["HEAD", "TAIL"]
  @head 0
  @tail 1
  def flip(flips) when flips > 0 do
    IO.puts("Flipped #{Enum.random(@coin_face)}!")
    flip(flips - 1)
  end
  def flip(0) do
  end
  def getFlippingStatistics(flips) when flips > 0 do
    getFlippingStatistics(flips, 0, 0)
  end
  def getFlippingStatistics(flips, headCount, tailCount) do
    randomFlip = Enum.random(@head..@tail) # indexOf(@coin_face, Enum.random(@coin_face))
    cond do
      flips > 0 ->
        getFlippingStatistics(flips - 1, headCount + (1 - randomFlip), tailCount + (randomFlip*randomFlip))
      flips == 0 ->
        [headCount, tailCount]
    end
  end
  def indexOf(list, keyword) do
    Enum.find_index(list, fn item -> item == keyword end)
  end
  def getPercentage(value, total) do 
    :erlang.float_to_binary((value / total) * 100, decimals: 2)
  end
end



IO.puts("Fliping A Coin 9 Times:\n")
Coin.flip(9) # flip 9 times

IO.puts("\nFlipping A Coin 999.999 Times:\n - Don't worry, it will just print the statistics.\n - Try to guess what will be the results.\n - The probability is 50/50.\n")
totalFlips = 999999
[heads, tails] = Coin.getFlippingStatistics(totalFlips)
[headsPrcnt, tailsPrcnt] = [Coin.getPercentage(heads, totalFlips), Coin.getPercentage(tails, totalFlips)]
IO.puts("Head Count > #{heads} (#{headsPrcnt}%)\nTail Count > #{tails} (#{tailsPrcnt}%)")


IO.puts("\nLet me guess, it resulted in almost 50%/49% or 49%/50% ins't it? that's because of the margin of error, it gets smaller as the flippings increases, with so many flips(999k) it gets around <1% of difference, but with just a few flips, the margin of error can increase to more than ~30%(3 flips for example).")