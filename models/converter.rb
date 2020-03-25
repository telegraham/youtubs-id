class Converter

  CHARS = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z - _)

  INTS = CHARS.each_with_index.reduce({}) do |accumulator, arr|
    char = arr.first
    idx = arr.last
    accumulator[char] = idx
    accumulator
  end

  def self.integerize(string)
    nums = string.split("").each_with_index.map do |char, idx|
      power = string.length - (idx + 1)
      INTS[char] * (64 ** power)
    end
    nums.sum
  end

  #todo: recursion
  def self.stringify(num)
    pow = find_largest_power_of_64_smaller_than(num)
    stringify_pow(num, pow)
  end

  private

  def self.stringify_pow(num, pow)
    if pow < 0
      return ""
    end
    place = 64 ** pow
    remainder = num % place
    number_in_place = (num - remainder) / place
    CHARS[number_in_place] + stringify_pow(remainder, pow - 1)
  end

  def self.find_largest_power_of_64_smaller_than(num)
    pow = 0
    while (64 ** pow) <= num
      pow += 1
    end
    [pow - 1, 0].max
  end

end