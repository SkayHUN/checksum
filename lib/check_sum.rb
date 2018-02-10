module CheckSum
  def sum(str)
    modified = str_modifier(str)
    result = word_count(str) + '-' + word_count(modified) + '-' + count_uppercas_vowels(modified) +
      '-' + count_consonants(modified) + '-' + string_length(str)
    result
  end

  def str_modifier(str)
    result = str.gsub(/[^A-Za-z]/i, '')
    result = result.gsub(/(.{10})(?=.)/, '\1 \2')
    result = result.titleize
    result = vowel_upcaser(result)
    result
  end

  def word_count(str)
    str.split.size.to_s
  end

  def string_length(str)
    str.split('').count.to_s
  end

  def vowel_upcaser(str)
    upcase_vowel = false
    double_consonants = false
    prev_char_consonant = false
    vowels = 'aeiouAEIOU'
    upcase_vowels = 'AEIOU'
    result = ''

    chars = str.split('')

    chars.each do |c|
      if c != ' '
        if vowels.include?(c)  #vowels
          if upcase_vowel && double_consonants
            c = c.upcase
          end

          if upcase_vowels.include?(c)
            upcase_vowel = true
          else
            upcase_vowel = false
          end

          double_consonants = false
          prev_char_consonant = false
        else   # consonants
          if prev_char_consonant
            double_consonants = true
          else
            prev_char_consonant = true
          end
        end
      end
      result += c
    end
    result
  end

  def count_consonants(str)
    str.scan(/[qwrtypsdfghjklzxcvbnmQWRTYPSDFGHJKLZXCVBNM]/).count.to_s
  end

  def count_uppercas_vowels(str)
    str.scan(/[AEUIO]/).count.to_s
  end
end
