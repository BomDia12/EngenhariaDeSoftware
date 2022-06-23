class Numeric
    @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
    
    def method_missing(method_id)
        singular_currency = method_id.to_s.gsub( /s$/, '')
        if @@currencies.has_key?(singular_currency)
            self * @@currencies[singular_currency]
        else
            super
        end
    end

    def in(target)
        singular_currency = target.to_s.gsub( /s$/, '')
        if @@currencies.has_key?(singular_currency)
            self * @@currencies[singular_currency]
        else
            super
        end
    end
end

class String
    def palindrome?
        string = self.downcase.gsub(/[^a-z]*/, '')
        string == string.reverse
    end
end

module Enumerable
    def palindrome?
        self == self.reverse unless self.is_a? Hash
    end
end

p 5.dollars.in(:euros)
p 10.euros.in(:rupees)

p "fof".palindrome?

p [1,2,3,2,1].palindrome? # => true
hsh = {oi: 2}
p hsh.palindrome?