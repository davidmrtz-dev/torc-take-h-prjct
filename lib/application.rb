require_relative './services/tax_flagger_service'
class Application
  class << self
    include Services

    def run()
      puts TaxFlaggerService.perform()
      sleep 1
    end
  end
end
