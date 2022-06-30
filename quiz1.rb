chamada = File.read('engsoft.txt', encoding: 'iso-8859-1').split("\n")

result = []

chamada.each do |line|
    matricula = line.match(/(\d{2}\/\d{7})/i)
    line.chomp!
    if matricula
        result << line.strip.gsub("    ", "\t")
    end
end

puts result
