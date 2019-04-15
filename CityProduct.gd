extends Node

var city = null
var product = null
var price = 0
var main
var forced_price_change = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _init(_main, _city, _product):
	main = _main
	city = _city
	product = _product
	main.connect("ARRIVE_AT_PORT", self, "update_city_product")
	
func update_city_product(_current_city):
	if _current_city == city:
		randomize()
		if randf() > .5 or forced_price_change:
			forced_price_change = false
			price = product.calculate_price()
		product.product_panel.update_price(price)
	
	
	

	
	
