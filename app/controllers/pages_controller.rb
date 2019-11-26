class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @name = current_user.name

    # current_user.stores
    # current_user.orders
    # current_user.reviews

  end
end
