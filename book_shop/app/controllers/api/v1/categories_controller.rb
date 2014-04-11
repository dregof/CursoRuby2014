module Api
  module V1
    class CategoriesController < Api::BaseController

      def index
        #categories = Category.all
        respond_with({
          success: true,
          categories: Category.non_empty.as_json(include: [:products])
        })
      end

    end
  end
end
