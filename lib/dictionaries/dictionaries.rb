module Dictionaries
  class ExemptProducts
    def self.dictionary
      %w[book chocolate chocolates pills]
    end
  end

  class ExceptedWords
    def self.dictionary
      %w[at CD bar box of bottle boxes packet]
    end
  end
end
