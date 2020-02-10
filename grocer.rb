def find_item_by_name_in_collection(name, collection)
  
  index = 0
  
  while index < collection.length do
    if collection[index][:item] == name
      return collection[index]
    end 
    collection[index]
    index += 1
  end
  nil 
end

def consolidate_cart(cart)
  
  con_cart = []
  index = 0
  
  while index < cart.length do
    new_item_cart = find_item_by_name_in_collection(cart[index][:item], con_cart)
    if new_item_cart
      new_item_cart[:count] += 1
    else
      new_item_cart = {
        :item => cart[index][:item],
        :price => cart[index][:price],
        :clearance => cart[index][:clearance],
        :count => 1
      }
      con_cart << new_item_cart
    end
    index += 1
  end
  con_cart
end

def apply_coupons(cart, coupons)
  
  couponed_goods = []
  index = 0 
  
  while index < coupons.length do
    item = find_item_by_name_in_collection(coupons[index][:item], cart)
    couponed_item = "#{coupons[index][:item]} W/COUPON"
    item_w_coupon_cart = find_item_by_name_in_collection(couponed_item, cart)
    if item && item[:count] >= coupons[index][:num]
      if item_w_coupon_cart
        item_w_coupon_cart[:count] += coupons[index][:num]
        item[:count] -= coupons[index][:num]
      
      else
        item_w_coupon_cart = {
          :item => couponed_item,
          :price => coupons[index][:cost] / coupons[index][:num],
          :clearance => item[:clearance],
          :count => coupons[index][:num]
        }
        
        cart << item_w_coupon_cart
        item[:count] -= coupons[index][:num]
        
      end
    end
    index += 1 
  end
  cart
end

def apply_clearance(cart)
  index = 0
  while index < cart.length do
    if cart[index][:clearance]
      (cart[index][:price] *= 0.8).round(2)
      puts cart
    end
    index += 1
  end 
  cart
end

fart = [
  {:item => "PEANUT BUTTER", :price => 3.00, :clearance => true,  :count => 2},
  {:item => "KALE", :price => 3.00, :clearance => false, :count => 3},
  {:item => "SOY MILK", :price => 4.50, :clearance => true,  :count => 1}
]

apply_clearance(fart)

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
