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
        computed_data.each do |prod|
          puts "#{prod.quantity} #{prod.description} #{prod.final_price}"
        end
        sales_taxes = computed_data.map(&:tax_rounded).inject(0.0, :+)
        total = computed_data.map(&:final_price).inject(0.0, :+)
        puts "Sales Taxes: #{sales_taxes}"
        puts "Total: #{total}"
        puts '======================================='
      end
    end
  end
end
