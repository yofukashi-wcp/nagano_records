module OrdersHelper
    def sum_quantity(orderproducts)
        sum= 0
        orderproducts.each do |orderproduct|
        sum += orderproduct.quantity
        end
        sum
    end
    def sum_price(orderproducts)
        sum= 0
        orderproducts.each do |orderproduct|
        sum += orderproduct.price * orderproduct.quantity
        end
        sum
    end
end
