require_relative './seed/data_entry'
require_relative './services/tax_flagger_service'
require_relative './services/tax_evaluator_service'
class Application
  class << self
    include Seed
    include Services

    def run()
      DataEntry.get_data.map do |products|
        flagged_data = TaxFlaggerService.perform(products)
        computed_data = TaxEvaluatorService.perform(flagged_data)
        byebug
        puts flagged_data
        sleep 1
      end
    end
  end
end
