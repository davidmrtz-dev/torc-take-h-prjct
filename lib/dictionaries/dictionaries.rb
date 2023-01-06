module Dictionaries
  class ExemptProducts
    def self.get_dictionary
      ['book', 'chocolate', 'chocolates', 'pills']
    end
  end

  class ExceptedWords
    def self.get_dictionary
      ['at', 'cd', 'bar', 'box', 'of', 'bottle', 'boxes', 'packet']
    end
  end
end