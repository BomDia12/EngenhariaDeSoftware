def combine_anagrams(words)
    groups = []

    words.each do |word|
        used = false
        groups.each do |group|
            if word.downcase.chars.sort == group[0].downcase.chars.sort
                group << word
                used = true
                break
            end
        end
        groups << [word] unless used
    end

    groups
end

p combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'])
