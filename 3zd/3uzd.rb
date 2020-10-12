class Vigenere
  def encrypt(string, keys)
    encrypted_word = ''

    string.each_char.with_index do |char, i|
      key = keys[i % keys.length]
      shifted_alpha = ALPHABET[key..-1] + ALPHABET[0...key]
      encrypted_word << shifted_alpha[ALPHABET.index(char)]
    end
    encrypted_word
  end

  def decrypt(string, keys)
    decrypted_word = ''

    string.each_char.with_index do |char, i|
      key = keys[i % keys.length]
      shifted_alpha = ALPHABET[-key..-1] + ALPHABET[0..-1 - key]
      decrypted_word << shifted_alpha[ALPHABET.index(char)]
    end

    decrypted_word
  end
end

ALPHABET = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z].freeze
vig = Vigenere. new

puts vig.encrypt('labas', [3, 2, 6])

puts vig.decrypt('ochdu', [3, 2, 6])
