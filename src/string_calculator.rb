class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiters = [",", "\n"]
    if numbers.start_with?("//")
      custom_delimiter = numbers[2]
      numbers = numbers[4..]
      delimiters << custom_delimiter
    end

    numbers.split(Regexp.union(delimiters)).map(&:to_i).sum
  end
end
