def palindrome?(string)
    string.downcase!.gsub!(/[^a-z]*/, '')
    reversed = string.reverse
    string == reversed
end

def count_words(string)
    list = string.downcase!.gsub!(/[^a-z ]*/, '').split(' ')

    hsh = {}
    list.each do |word|
        if hsh[word]
            hsh[word] += 1
        else
            hsh[word] = 1
        end
    end
    hsh
end

p palindrome?("A man, a plan, a canal -- Panama") #=> true
p palindrome?("Madam, I'm Adam!") # => true
p palindrome?("Abracadabra") # => false (nil is also ok)

p count_words("A man, a plan, a canal -- Panama") # => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
p count_words "Doo bee doo bee doo" # => {'doo' => 3, 'bee' => 2}