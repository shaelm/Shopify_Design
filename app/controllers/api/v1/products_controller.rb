module Api
  module V1
    class ProductsController < ApplicationController


      def product_params  # for updating
        params.permit(:inventory_count)
      end

      def purchase_params  # for updating
        params.permit(:id)
      end




      def index
        products= Product.order('title ASC');
        render json: {status: 'SUCCESS', message:'Loaded products', data:products},status: :ok
      end


    # search for a product in the inventory by name
      def show
        product = Product.where('title = ? ' , params[:id])
        if product.empty?
          render json: {status: 'Fail', message:' Could not Find Product!'},status: :ok;
        else
        render json: {status: 'SUCCESS', message:'Found Product!', data:product},status: :ok
        end

      end

      def avail
       products = Product.where('inventory_count > 0')
       render json: {status: 'SUCCESS', message:'Loaded products', data:products},status: :ok
      end

      def purchase
         product = Product.where('title = ? ' , params[:id])
         if product.empty?
           render json: {status: 'Fail', message:' Could not Find Product!'},status: :ok;
         else
           @curr= product.select('inventory_count AS count').first.count
         if @curr > 0
           product.update(inventory_count: @curr-1)
           render json: {status: 'SUCCESS', message:'Product was Purchased', data:product},status: :ok

         else
           render json: {status: 'SUCCESS', message:'Product is out of stock', data:product},status: :ok
         end
         end




      end

      def update
        product = Product.where('title = ? ' , params[:id])
        if product.update(product_params)
          render json: {status: 'SUCCESS', message:'Updated article', data:product},status: :ok
        else
          render json: {status: 'ERROR', message:'Article not updated', data:product.errors},status: :unprocessable_entity
        end
      end





    end
  end
end
