class CartsController < ApplicationController
    def index
        Order.create!(
   [
      { 
         user_id: '2',
         zip_code: '1111111',
         address: '神奈川県海老名市上郷5-5-5',
         phone_number: '11111111111',
         postage: '500',
         total: '5000',
         payment: '0',
         status: '2',

         }])

        OrderProduct.create!(  
   [
      { 
         order_id: 3,
         product_id: 1,
         quantity: 1,
         price: '15000',
         }

      
      ])

    end

    def create

    end

    def update

    end

    def destroy

    end
end
