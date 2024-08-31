class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiters = [",", "\n"]
    if numbers.start_with?("//")
      custom_delimiter = numbers[2]
      numbers = numbers[4..]
      delimiters << custom_delimiter
    end

    numbers_array = numbers.split(Regexp.union(delimiters)).map(&:to_i)
    negatives = numbers_array.select { |n| n < 0 }

    if negatives.any?
      raise "Negative numbers not allowed: #{negatives.join(', ')}"
    end

    numbers_array.sum
  end
end
