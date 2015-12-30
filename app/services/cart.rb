class Cart
    def initialize(session, purchase_id=nil)
    @session = session

    @session['cart'] ||= {}
    @session['cart']['dogs'] ||= {}
    @session['purchase'] ||= purchase_id
  end

  def cart_dogs_hash
    @session['cart']['dogs']
  end

  def add_dog_to_cart_hash(dog_id)
    if cart_dogs_hash[dog_id.to_s].present?
      cart_dogs_hash[dog_id.to_s] += 1
    else
      cart_dogs_hash[dog_id.to_s] = 1
    end
  end

  def remove_dog_from_cart(dog_id)
    dog_id = dog_id.to_s
    cart_dogs_hash.delete(dog_id)
  end

  def clear_purchase_hash
     @session['purchase'] = nil
  end

  def save_cart
    begin
      cart_dogs_hash.each do |dog_id, quantity|
        dog = Dog.find_by(id: dog_id)
        if dog
          purchase_dogs = PurchasesDog.new(dog: dog, quantity: quantity, purchase: purchase)
          purchase_dogs.save!
        end
        remove_dog_from_cart(dog_id)
      end

      clear_purchase_hash

      true
    rescue
      false
    end
  end

  def purchase
    Purchase.find_by(id: @session['purchase'])
  end

end
