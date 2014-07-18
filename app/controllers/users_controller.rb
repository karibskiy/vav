class UsersController < ApplicationController
  def profile
  end
  def orders
    @orders = Order.find_by_uid(current_user.id)

  end

  def logout
  end

  def login
  	
  end

  def create

  	@user = User.new(user_params)
  	
  	if @user.save
  		#
  		flash.now[:success] = "New Account Created. Please Login Now"
  		redirect_to product_path
  	else
  		# p errors.full_messages
  		e = @user.errors.full_messages
  		p e
  		e.each do |i|
  			flash.now[:danger] = i
  		end
  		render 'new'
  	end

  end
  def new
  	@user = User.new
  end


  def orders
    @orders = Order.where(:uid=>current_user.id)

    @orders.each do |i|
      p = Product.find(i.pid)
      i.instance_variable_set(:@product_name, p.name)
      i.instance_variable_set(:@product_price, p.price)
    end
  end

  def profile
    
  end


  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)

  		
  	end
end
