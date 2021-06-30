class ValidBin 
    def parse_str_to_array_integer(card_number_str)
        return card_number_str.split("").map(&:to_i)
    end

    def luhn_algorithm(card_number)
        card_number_int = self.parse_str_to_array_integer(card_number)
        s = 0
        for i in (1..8)
            card_number_int[2*i-2] = card_number_int[2*i-2]*2 >= 10 ? ((card_number_int[2*i-2]*2)/10)+((card_number_int[2*i-2]*2)%10) : card_number_int[2*i-2]*2
        end

        for i in (0..14)
            s += card_number_int[i]
        end

        if(10-(s%10) == card_number_int[-1])
            return true
        else
            return false
        end
    end
end

validBin = ValidBin.new

cc = "4562215002542344"
puts validBin.luhn_algorithm(cc)