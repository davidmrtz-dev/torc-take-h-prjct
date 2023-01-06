require_relative './services/tax_flagger_service'
require_relative './seed/data_entry'
class Application
  class << self
    include Seed
    include Services

    def run()
      DataEntry.get_data.map do |products|
        flagged_data = TaxFlaggerService.perform(products)
        puts flagged_data
        sleep 1
      end
    end
  end
end
