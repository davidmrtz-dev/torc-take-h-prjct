require_relative './dictionaries/dictionaries'
class Application
  @exempt_dict = nil
  @excepted_words = nil

  class << self
    include Dictionaries

    def setup
      @exempt_dict ||= ExemptProducts.get_dictionary
      @excepted_words ||= ExceptedWords.get_dictionary
    end

    def run
      puts 'hello app'
      puts @exempt_dict
      sleep 1
    end
  end
end
