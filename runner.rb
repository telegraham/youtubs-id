require_relative 'environment'

#puts 10000.times.map { SecureRandom.uuid }.sort.map { |uuid| num = uuid.gsub("-", "").hex; "#{ uuid } #{ num }" }.join("\r\n")

# i = 0
loop do
  uuid = SecureRandom.uuid
  num = uuid.gsub("-", "").hex
  stringified = Converter.stringify(num)
  back = Converter.integerize(stringified)
  matches = num == back
  back_str = matches ? "ok".green : back_str.red
  puts "#{ uuid } #{num}\t#{stringified}\t#{back_str}"
  unless matches
    break
  end
  sleep 0.1
  # i += 1
end
