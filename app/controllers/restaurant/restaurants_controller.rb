class Restaurant::RestaurantsController < ApplicationController
  
  def index
    @restaurants = Restaurant.all
    @food_categories = FoodCategory.all
  end
  
  def new
    @restaurant = current_user.restaurants.build
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    if @restaurant.save
      flash[:success] = I18n.t("controllers.restaurant.restaurants_controller.success")
      redirect_to business_dashboard_path
    else
      flash[:danger] = I18n.t("controllers.restaurant.restaurants_controller.danger")
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:owner_id, :name, :address)
  end

end
