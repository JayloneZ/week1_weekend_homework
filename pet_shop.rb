def pet_shop_name(hash)
  return hash[:name]
end

def total_cash(hash)
  return hash[:admin][:total_cash]
end

def add_or_remove_cash(hash, money)
  return hash[:admin][:total_cash] += money
end

def pets_sold(hash)
  return hash[:admin][:pets_sold]
end

def increase_pets_sold(hash, amount_of_pets_sold)
  return hash[:admin][:pets_sold] += amount_of_pets_sold
end

def stock_count(hash)
  return hash[:pets].length
end

def pets_by_breed(hash, pet_breed)
  matching_pet_breed = []
  for pet in hash[:pets]
    if pet[:breed] == pet_breed
      matching_pet_breed.push(pet_breed)
    end
  end
  return matching_pet_breed
end

def find_pet_by_name(hash, pet_name)
  for pet in hash[:pets]
    if pet[:name] == pet_name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(hash, pet_name)
  for pet in hash[:pets]
    if pet[:name] == pet_name
      hash[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(hash, new_pet)
  hash[:pets].push(new_pet)
end

def customer_pet_count(hash)
  hash[:pets].count
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

def customer_can_afford_pet(customer, pet)
  customer[:cash] > pet[:price]
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil
    pet_name = pet[:name]
    if customer_can_afford_pet(customer, pet)
      add_pet_to_customer(customer, pet)
      add_or_remove_cash(pet_shop, pet[:price])
      customer[:cash] -= pet[:price]
      increase_pets_sold(pet_shop, 1)
      remove_pet_by_name(pet_shop, pet_name)
    end
  end
end
