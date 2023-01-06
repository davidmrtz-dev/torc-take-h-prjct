require_relative '../dictionaries/dictionaries'

module Services
  class TaxFlaggerService
    class << self
      include Dictionaries

      def perform(products)
        # perform calculation
        # that will return the following
        [
          {
            quantity: 2,
            description: 'book:',
            price: 12.49,
            applicable_tax: false,
            applicable_i_tax: false
          },
          {
            quantity: 1,
            description: 'music CD:',
            price: 14.99,
            applicable_tax: true,
            applicable_i_tax: false
          },
          {
            quantity: 1,
            description: 'chocolate bar:',
            price: 0.85,
            applicable_tax: false,
            applicable_i_tax: false
          }
        ]
      end
    end
  end
end