module Seed
  class DataEntry
    def self.get_data
      [
        # [
        #   {
        #     quantity: 2,
        #     description: 'book at',
        #     price: 12.49
        #   },
        #   {
        #     quantity: 1,
        #     description: 'music CD at',
        #     price: 14.99
        #   },
        #   {
        #     quantity: 1,
        #     description: 'chocolate bar at',
        #     price: 0.85
        #   }
        # ],
        [
          {
            quantity: 1,
            description: 'imported box of chocolates at',
            price: 10.00
          },
          {
            quantity: 1,
            description: 'imported bottle of perfume at',
            price: 47.50
          },
        ],
        # [
        #   {
        #     quantity: 1,
        #     description: 'imported bottle of perfume at',
        #     price: 27.99
        #   },
        #   {
        #     quantity: 1,
        #     description: 'bottle of perfume at',
        #     price: 18.99
        #   },
        #   {
        #     quantity: 1,
        #     description: 'packet of headache pills at',
        #     price: 9.75
        #   },
        #   {
        #     quantity: 3,
        #     description: 'imported boxes of chocolates at',
        #     price: 11.25
        #   }
        # ],
      ]
    end
  end
end