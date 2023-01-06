module Services
  class TaxEvaluatorService
    class << self
      def perform(flagged_products)
        flagged_products.map do |product|
          computed_product = OpenStruct.new({
                                              quantity: product.quantity,
                                              description: product.description,
                                              final_price: 0.00,
                                              tax_applied: 0.00,
                                              tax_rounded: 0.00
                                            })

          computed_product.tax_applied = (product.price * 0.1) if product.applicable_tax
          if product.applicable_i_tax
            computed_product.tax_applied =
              apply_i_tax(computed_product, product)
          end

          computed_product.tax_rounded = round_applied_tax(computed_product.tax_applied)
          computed_product.final_price = ((product.quantity * product.price) + computed_product.tax_rounded).round(2)
          computed_product
        end
      end

      private

      def apply_i_tax(cprod, prod)
        apply_box_factor = prod.description.include?('box') && prod.quantity > 1

        cprod.tax_applied + (((prod.price * 0.05) + (apply_box_factor ? 0.04 : 0)) * prod.quantity)
      end

      def round_applied_tax(tax_applied)
        num_arr = tax_applied.to_s.split('.')

        return tax_applied if tax_applied.zero? || (num_arr[num_arr.length - 1].length.eql? 1)

        num_to_eval = num_arr[1].slice(1..).slice(...2)
        num_to_eval = "#{num_to_eval}0" if num_to_eval.length.eql? 1
        num_to_eval = num_to_eval.to_i

        return tax_applied.round(2) if num_to_eval >= 75

        rounded_value = 50 if num_to_eval >= 25 && num_to_eval < 75

        "#{num_arr[0]}.#{num_arr[1].slice(0)}#{rounded_value}".to_f
      end
    end
  end
end
