chamada = File.read('engsoft.txt').split

result = []

chamada.each do |line|
    match_data = line =~ /(\d{2}\/\d{7})\w*([a-z]*)/i
    if match_data
        result << [match_data[0], match_data[1]]
    end
end

p result
