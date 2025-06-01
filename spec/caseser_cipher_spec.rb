# frozen_string_literal: true

require_relative '../lib/caesar_cipher'

describe '#caesar_ciphers' do
  context 'when text is one word containing letters only' do
    it 'returns  mjqqt' do
      expect(caesar_cipher('hello', 5)).to eq('mjqqt')
    end
  end

  context 'when text is one word containing not only letters' do
    it 'returns  /mjqqt7?' do
      expect(caesar_cipher('/hello7?', 5)).to eq('/mjqqt7?')
    end
  end

  context 'when shift is negative' do
    it 'returns cd' do
      expect(caesar_cipher('hi', -5)).to eq('cd')
    end
  end

  context 'when provided with text of various cases' do
    it 'preserves word casing' do
      expect(caesar_cipher('Gideon', 5)).to eq('Lnijts')
    end
  end

  context 'when provided with full passage or sentence' do
    it 'maintains all punctuations' do
      message = 'The quick fox, dog and rabbit.'
      decrypted_message = 'Ymj vznhp ktc, itl fsi wfggny.'
      expect(caesar_cipher(message, 5)).to eq(decrypted_message)
    end
  end

  context 'when large shift' do
    it 'does not go off limits' do
      expect(caesar_cipher('Gideon', 95)).to eq('Xzuvfe')
    end
  end
end
