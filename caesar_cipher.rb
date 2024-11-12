def caesar_cipher(text, shift)
    
    #check if `shift` is a number
    if !shift.is_a?(Numeric)
        return "Invalid input"
    elsif shift.is_a?(Numeric)
        shift = shift.to_i
    end
    #wrap large numbers
    if shift >= 26
        shift = shift % 26
    end
    #convert characters to code
    character_codes_array = text.bytes
    #encode
    debugger
    shifted_codes = character_codes_array.map do |character_code|
        if (65..90).include?(character_code)
            character_code += shift
            if character_code > 90 
                character_code -= 26
            elsif character_code < 65
                character_code += 26
            end
        elsif (97..122).include?(character_code)
            character_code += shift
            if character_code > 122
              character_code -= 26
            elsif character_code < 97
                character_code += 26
            end
        end
        character_code
    end
    shifted_codes.pack("C*")
end
caesar_cipher(44, 2)