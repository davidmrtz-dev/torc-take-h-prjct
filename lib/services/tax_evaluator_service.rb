require_relative '../dictionaries/dictionaries'

module Services
  class TaxEvaluatorService
    class << self
      include Dictionaries

      def perform
        ExemptProducts.get_dictionary
      end
    end
  end
end