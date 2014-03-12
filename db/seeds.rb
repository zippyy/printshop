CartItem.destroy_all
Product.destroy_all
Finish.destroy_all
Quantity.destroy_all
Size.destroy_all
Price.destroy_all

Product.create!([
  {name: "Postcard", custom: false},
  {name: "Business Card", custom: false},
  {name: "Store Sign", custom: true},
  {name: "Banner", custom: true}
])

postcard = Product.find_by(name: "Postcard")
business_card = Product.find_by(name: "Business Card")

#finishes

Finish.create!([
  {product_id: postcard.id, finish: "16 pt. Semigloss"},
  {product_id: postcard.id, finish: "16 pt. Matte"},
  {product_id: postcard.id, finish: "14 pt. Uncoated"},
  {product_id: postcard.id, finish: "16 pt. High Gloss (1 or 2 sided)"},
  {product_id: postcard.id, finish: "18.5 Matte Laminated"},
  {product_id: business_card.id, finish: "16 pt. Semigloss"},
  {product_id: business_card.id, finish: "16 pt. Matte"},
  {product_id: business_card.id, finish: "14 pt. Uncoated"},
  {product_id: business_card.id, finish: "16 pt. High Gloss ( 1 or 2 sided)"},
  {product_id: business_card.id, finish: "18.5 pt. Matte Laminated"}
])

  pc_sixteen_semi = Finish.find_by(product_id: postcard.id, finish: "16 pt. Semigloss")
  pc_sixteen_matte = Finish.find_by(product_id: postcard.id, finish: "16 pt. Matte")
  pc_fourteen_uncoated = Finish.find_by(product_id: postcard.id, finish: "14 pt. Uncoated")
  pc_sixteen_high = Finish.find_by(product_id: postcard.id, finish: "16 pt. High Gloss (1 or 2 sided)")
  pc_eighteen_matte = Finish.find_by(product_id: postcard.id, finish: "18.5 Matte Laminated")

  bc_sixteen_semi = Finish.find_by(product_id: business_card.id, finish: "16 pt. Semigloss")
  bc_sixteen_matte = Finish.find_by(product_id: business_card.id, finish: "16 pt. Matte")
  bc_fourteen_uncoated = Finish.find_by(product_id: business_card.id, finish: "14 pt. Uncoated")
  bc_sixteen_high = Finish.find_by(product_id: business_card.id, finish: "16 pt. High Gloss ( 1 or 2 sided)")
  bc_eighteen_matte = Finish.find_by(product_id: business_card.id, finish: "18.5 pt. Matte Laminated")


Quantity.create!([
  {product_id: postcard.id, quantity: 100},
  {product_id: postcard.id, quantity: 250},
  {product_id: postcard.id, quantity: 500},
  {product_id: postcard.id, quantity: 1000},
  {product_id: postcard.id, quantity: 2500},
  {product_id: postcard.id, quantity: 5000},
  {product_id: business_card.id, quantity: 100},
  {product_id: business_card.id, quantity: 250},
  {product_id: business_card.id, quantity: 500},
  {product_id: business_card.id, quantity: 1000},
  {product_id: business_card.id, quantity: 2500},
  {product_id: business_card.id, quantity: 5000}
])

  pc_100 = Quantity.find_by(product_id: postcard.id, quantity: 100)
  pc_250 = Quantity.find_by(product_id: postcard.id, quantity: 250)
  pc_500 = Quantity.find_by(product_id: postcard.id, quantity: 500)
  pc_1000 = Quantity.find_by(product_id: postcard.id, quantity: 1000)
  pc_2500 = Quantity.find_by(product_id: postcard.id, quantity: 2500)
  pc_5000 = Quantity.find_by(product_id: postcard.id, quantity: 5000)

  bc_100 = Quantity.find_by(product_id: business_card.id, quantity: 100)
  bc_250 = Quantity.find_by(product_id: business_card.id, quantity: 250)
  bc_500 = Quantity.find_by(product_id: business_card.id, quantity: 500)
  bc_1000 = Quantity.find_by(product_id: business_card.id, quantity: 1000)
  bc_2500 = Quantity.find_by(product_id: business_card.id, quantity: 2500)
  bc_5000 = Quantity.find_by(product_id: business_card.id, quantity: 5000)

Size.create!([
  {size: "4x6", product_id: postcard.id},
  {size: "5x7", product_id: postcard.id},
  {size: "3.5x2", product_id: business_card.id}
])

# SIZES
five_by_seven = Size.find_by(size: "5x7", product_id: postcard.id)
three_five_by_two = Size.find_by(size: "3.5x2", product_id: business_card.id)
four_by_six = Size.find_by(size: "4x6", product_id: postcard.id)


Price.create!([
  {price: 0,    product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_eighteen_matte.id,    quantity_id: pc_100.id},
  {price: 0,    product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_eighteen_matte.id,    quantity_id: pc_250.id},
  {price: 250,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_eighteen_matte.id,    quantity_id: pc_500.id},
  {price: 300,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_eighteen_matte.id,    quantity_id: pc_1000.id},
  {price: 0,    product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_eighteen_matte.id,    quantity_id: pc_2500.id},
  {price: 0,    product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_eighteen_matte.id,    quantity_id: pc_5000.id},
  {price: 40,   product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_sixteen_semi.id,      quantity_id: bc_100.id},
  {price: 49,   product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_sixteen_semi.id,      quantity_id: bc_250.id},
  {price: 59,   product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_sixteen_semi.id,      quantity_id: bc_500.id},
  {price: 69,   product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_sixteen_semi.id,      quantity_id: bc_1000.id},
  {price: 99,   product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_sixteen_semi.id,      quantity_id: bc_2500.id},
  {price: 150,  product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_sixteen_semi.id,      quantity_id: bc_5000.id},
  {price: 40,   product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_sixteen_matte.id,     quantity_id: bc_100.id},
  {price: 49,   product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_sixteen_matte.id,     quantity_id: bc_250.id},
  {price: 59,   product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_sixteen_matte.id,     quantity_id: bc_500.id},
  {price: 69,   product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_sixteen_matte.id,     quantity_id: bc_1000.id},
  {price: 99,   product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_sixteen_matte.id,     quantity_id: bc_2500.id},
  {price: 150,  product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_sixteen_matte.id,     quantity_id: bc_5000.id},
  {price: 45,   product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_fourteen_uncoated.id, quantity_id: bc_100.id},
  {price: 55,   product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_fourteen_uncoated.id, quantity_id: bc_250.id},
  {price: 65,   product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_fourteen_uncoated.id, quantity_id: bc_500.id},
  {price: 75,   product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_fourteen_uncoated.id, quantity_id: bc_1000.id},
  {price: 125,  product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_fourteen_uncoated.id, quantity_id: bc_2500.id},
  {price: 60,   product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_sixteen_semi.id,      quantity_id: pc_100.id},
  {price: 175,  product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_fourteen_uncoated.id, quantity_id: bc_5000.id},
  {price: 85,   product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_sixteen_semi.id,      quantity_id: pc_250.id},
  {price: 125,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_sixteen_semi.id,      quantity_id: pc_500.id},
  {price: 40,   product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_sixteen_high.id,      quantity_id: bc_100.id},
  {price: 49,   product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_sixteen_high.id,      quantity_id: bc_250.id},
  {price: 59,   product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_sixteen_high.id,      quantity_id: bc_500.id},
  {price: 69,   product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_sixteen_high.id,      quantity_id: bc_1000.id},
  {price: 99,   product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_sixteen_high.id,      quantity_id: bc_2500.id},
  {price: 175,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_sixteen_semi.id,      quantity_id: pc_1000.id},
  {price: 150,  product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_sixteen_high.id,      quantity_id: bc_5000.id},
  {price: 0,    product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_eighteen_matte.id,    quantity_id: bc_100.id},
  {price: 215,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_sixteen_semi.id,      quantity_id: pc_2500.id},
  {price: 0,    product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_eighteen_matte.id,    quantity_id: bc_250.id},
  {price: 250,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_sixteen_semi.id,      quantity_id: pc_5000.id},
  {price: 125,  product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_eighteen_matte.id,    quantity_id: bc_500.id},
  {price: 150,  product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_eighteen_matte.id,    quantity_id: bc_1000.id},
  {price: 100,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_sixteen_matte.id,     quantity_id: pc_100.id},
  {price: 0,    product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_eighteen_matte.id,    quantity_id: bc_2500.id},
  {price: 0,    product_id: business_card.id, size_id: three_five_by_two.id,  finish_id: bc_eighteen_matte.id,    quantity_id: bc_5000.id},
  {price: 85,   product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_sixteen_matte.id,     quantity_id: pc_250.id},
  {price: 125,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_sixteen_matte.id,     quantity_id: pc_500.id},
  {price: 175,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_sixteen_matte.id,     quantity_id: pc_1000.id},
  {price: 215,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_sixteen_matte.id,     quantity_id: pc_2500.id},
  {price: 250,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_sixteen_matte.id,     quantity_id: pc_5000.id},
  {price: 75,   product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_fourteen_uncoated.id, quantity_id: pc_100.id},
  {price: 100,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_fourteen_uncoated.id, quantity_id: pc_250.id},
  {price: 150,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_fourteen_uncoated.id, quantity_id: pc_500.id},
  {price: 195,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_fourteen_uncoated.id, quantity_id: pc_1000.id},
  {price: 250,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_fourteen_uncoated.id, quantity_id: pc_2500.id},
  {price: 275,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_fourteen_uncoated.id, quantity_id: pc_5000.id},
  {price: 60,   product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_sixteen_high.id,      quantity_id: pc_100.id},
  {price: 85,   product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_sixteen_high.id,      quantity_id: pc_250.id},
  {price: 125,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_sixteen_high.id,      quantity_id: pc_500.id},
  {price: 175,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_sixteen_high.id,      quantity_id: pc_1000.id},
  {price: 215,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_sixteen_high.id,      quantity_id: pc_2500.id},
  {price: 500,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_sixteen_high.id,      quantity_id: pc_5000.id},
  {price: 0,    product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_eighteen_matte.id,    quantity_id: pc_100.id},
  {price: 0,    product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_eighteen_matte.id,    quantity_id: pc_250.id},
  {price: 125,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_eighteen_matte.id,    quantity_id: pc_500.id},
  {price: 175,  product_id: postcard.id,      size_id: four_by_six.id,          finish_id: pc_eighteen_matte.id,    quantity_id: pc_1000.id},
  {price: 75,   product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_sixteen_semi.id,      quantity_id: pc_100.id},
  {price: 120,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_sixteen_semi.id,      quantity_id: pc_250.id},
  {price: 159,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_sixteen_semi.id,      quantity_id: pc_500.id},
  {price: 199,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_sixteen_semi.id,      quantity_id: pc_1000.id},
  {price: 249,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_sixteen_semi.id,      quantity_id: pc_2500.id},
  {price: 299,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_sixteen_semi.id,      quantity_id: pc_5000.id},
  {price: 75,   product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_sixteen_matte.id,     quantity_id: pc_100.id},
  {price: 120,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_sixteen_matte.id,     quantity_id: pc_250.id},
  {price: 159,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_sixteen_matte.id,     quantity_id: pc_500.id},
  {price: 199,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_sixteen_matte.id,     quantity_id: pc_1000.id},
  {price: 249,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_sixteen_matte.id,     quantity_id: pc_2500.id},
  {price: 299,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_sixteen_matte.id,     quantity_id: pc_5000.id},
  {price: 85,   product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_fourteen_uncoated.id, quantity_id: pc_100.id},
  {price: 125,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_fourteen_uncoated.id, quantity_id: pc_250.id},
  {price: 165,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_fourteen_uncoated.id, quantity_id: pc_500.id},
  {price: 225,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_fourteen_uncoated.id, quantity_id: pc_1000.id},
  {price: 275,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_fourteen_uncoated.id, quantity_id: pc_2500.id},
  {price: 350,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_fourteen_uncoated.id, quantity_id: pc_5000.id},
  {price: 75,   product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_sixteen_high.id,      quantity_id: pc_100.id},
  {price: 120,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_sixteen_high.id,      quantity_id: pc_250.id},
  {price: 159,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_sixteen_high.id,      quantity_id: pc_500.id},
  {price: 199,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_sixteen_high.id,      quantity_id: pc_1000.id},
  {price: 249,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_sixteen_high.id,      quantity_id: pc_2500.id},
  {price: 299,  product_id: postcard.id,      size_id: five_by_seven.id,        finish_id: pc_sixteen_high.id,      quantity_id: pc_5000.id}
])