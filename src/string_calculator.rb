class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    return numbers.to_i if numbers.split(",").length == 1

    numbers.split(",").map(&:to_i).sum
  end
end
