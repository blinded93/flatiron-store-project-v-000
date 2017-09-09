PHONES = [{title: "iPhone 8S Plus", price: 75000, inventory: 1000}, {title: "iPod Touch", price: 20000, inventory: 300}]
TABLETS = [{title: "iPad Pro", price: 90000, inventory: 300}, {title: "iPod Classic", price: 40000, inventory: 200}]
COMPUTERS = [{title: "iMac", price: 120000, inventory: 500}, {title: "Mac Pro", price: 400000, inventory: 50}]
LAPTOPS = [{title: "MacBook Pro 13", price: 200000, inventory: 150}]
ACCESSORIES = [{title: "Magic Keyboard", price: 5000, inventory: 400}, {title: "Magic Mouse", price: 5000, inventory: 400}]

USERS = [{email: "blinded93@gmail.com", password: "password"}, {email: "montiechristo@gmail.com", password: "password"}, {email: "cutekittycat@gmail.com", password: "password"}, {email: "princesspowerranger@gmail.com", password: "password"}]

CATEGORIES = [{title: 'Tablets'}, {title: 'Phones'}, {title: 'Computers'}, {title: 'Laptops'}, {title: 'Accessories'}]

CATEGORIES.each do |cat|
  category = Category.create(cat)
  Object.const_get(category.title.upcase).each do |item|
    category.items.create(item)
  end
end

USERS.each do |user|
  User.create(user)
end
