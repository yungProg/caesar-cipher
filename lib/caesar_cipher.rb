# frozen_string_literal: true

def caesar_cipher(text, shift) # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity
  # check if `text`` is a string
  return 'Invalid input. Enter a string of text(s)' unless text.is_a?(String)

  # check if `shift` is a number
  if !shift.is_a?(Numeric)
    return 'Invalid input. Please enter a number'
  elsif shift.is_a?(Numeric)
    shift = shift.to_i
  end

  # wrap large numbers
  shift %= 26 if shift >= 26

  # convert characters to code
  character_codes_array = text.bytes

  # encode
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
  shifted_codes.pack('C*')
end
