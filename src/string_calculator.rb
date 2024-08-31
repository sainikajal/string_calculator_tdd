class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiters = [",", "\n"]
    if numbers.start_with?("//")
      delimiter_part, numbers = numbers[2..].split("\n", 2)
      
      # Check if the delimiter is enclosed in brackets (multiple characters)
      if delimiter_part.start_with?("[") && delimiter_part.end_with?("]")
        custom_delimiters = delimiter_part.scan(/\[([^\]]+)\]/).flatten
        delimiters.concat(custom_delimiters)
      else
        # Single character delimiter
        delimiters << delimiter_part
      end
    end

    numbers_array = numbers.split(Regexp.union(delimiters)).map(&:to_i)
    negatives = numbers_array.select { |n| n < 0 }

    if negatives.any?
      raise "Negative numbers not allowed: #{negatives.join(', ')}"
    end

    numbers_array.reject { |n| n > 1000 }.sum
  end
end
