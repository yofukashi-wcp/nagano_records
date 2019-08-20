module AdminOrdersHelper
    def sum_quantity(orderproducts)
        sum= 0
        orderproducts.each do |orderproduct|
        sum += orderproduct.quantity
        end
        sum
    end
end
