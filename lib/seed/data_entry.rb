module Seed
  class DataEntry
    def self.get_data
      [
        [
          {
            quantity: 2,
            description: 'book at',
            price: 12.49
          },
          {
            quantity: 1,
            description: 'music CD at',
            price: 14.99
          },
          {
            quantity: 1,
            description: 'chocolate bar at',
            price: 0.85
          }
        ]
      ]
    end
  end
end