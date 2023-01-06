require_relative './services/tax_evaluator_service'
class Application
  class << self
    include Services

    def run
      puts TaxEvaluatorService.perform
      sleep 1
    end
  end
end
