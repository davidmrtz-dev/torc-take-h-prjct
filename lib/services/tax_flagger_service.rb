require_relative '../dictionaries/dictionaries'

module Services
  class TaxFlaggerService
    class << self
      include Dictionaries

      def perform(products)
        products.map do |product|
          product = OpenStruct.new(product)
          product.applicable_tax = false
          product.applicable_i_tax = false

          product.applicable_tax = true if product.description.split.none? do |word|
            ExemptProducts.dictionary.include?(word)
          end

          if product.description.include?('imported')
            product.applicable_i_tax =
              true
          end
          product.description = "#{product.description.slice(..-4)}:"
          product
        end
      end
    end
  end
end
