class CheckoutController < ApplicationController
  def new
  	if !signed_in?
  		flash[:danger] = "Зарегистрируйтесь чтобы продолжать"
  		redirect_to signin_path
  	else
	  	uid = params[:user_id]
	  	pid = params[:product_id]
	  	o = Cart.new(uid:uid, pid:pid)
	  	o.save
	end
  end	

  def show
  	@all_items = Cart.where(:uid => current_user.id)
  	@all_items.each do |i|
  		pid = i.pid
  		i.instance_variable_set(:@pname, Product.find(pid).name)
  	end
  end

  def destroy
  	item = Cart.find(params[:id])

  	if Cart.delete(item)
  		flash[:success] = "Успешно удалено из корзины"
  		redirect_to mycart_path
  	else
  		flash[:danger] = "Ошибка удаления"
  	end
  end

  def destroyfinal
  	item = Cart.find(params[:id])

  	if Cart.delete(item)
  		flash[:success] = "Успешно удалено"
  		redirect_to checkout_path
  	else
  		flash[:danger] = "Ошибка удаленя"
  	end
  end

  def index
  	
  	@items = Cart.where(:uid => current_user.id)
  	@sum = 0
  	@items.each do |i|
  		p = Product.find(i.pid)
  		i.instance_variable_set(:@product_name, p.name)
  		i.instance_variable_set(:@product_price, p.price)
  		@sum += p.price
  	end
  	@addresses = Address.where(:uid => current_user.id)
  end


  def stores


  end

  def ship
  	
  end
  
  def final_store

    date = params[:datepick]
    if date == ""
      flash[:danger] = "Введите дату"
      redirect_to store_address_path
      return
    end
  	@items = Cart.where(:uid => current_user.id)
    status = true
    @items.each do |i|
      uid = i.uid
      pid = i.pid
      pickup = true
      address = nil
      order = Order.new(:uid=>uid, :pid=>pid, :pickup=>pickup, :address=>address, :date=>date)
      order.save
      i.delete
    end
    if status == false
      flash[:danger] = "Error Processing Request"
    else

      flash[:success] = "Order Placed Successfully"
    end
    redirect_to orders_path
  end


  def final_ship

    build = params[:building_no]
    street = params[:street_name]
    locality = params[:locality_name]
    city = params[:city]
    pincode = params[:pincode]
    mobile = params[:mobile]
    if [build, street, locality, city, pincode, mobile].any? {|i| i==""}
      flash[:danger] = "Please Fill in the Complete Details"
      redirect_to shipping_path
    else
      @items = Cart.where(:uid => current_user.id)
      status = true
      @items.each do |i|
        uid = i.uid
        pid = i.pid
        pickup = false
        address = nil

        order = Order.new(:uid=>uid, :pid=>pid, :pickup=>pickup, 
          :building_no=>build, :street_name=>street, :locality_name=>locality, :city=>city, 
          :pincode=>pincode, :mobile=>mobile)
        order.save
        i.delete
      end
      if status == false
        flash[:danger] = "Error Processing Request"
      else

        flash[:success] = "Order Placed Successfully"
      end
      redirect_to orders_path

    end
  end

end
