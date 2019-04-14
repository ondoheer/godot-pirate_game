extends Panel

# Declare member variables here. Examples:
var cash = 250
var firm_name = "Ondoheer's Pirate Trader"

var city = preload("res://City.gd")
var product = preload("res://Product.gd")
var city_product = preload("res://CityProduct.gd")

var cities = []
var current_city_index = 0

var products = []

# Called when the node enters the scene tree for the first time.
func _ready():
	create_Products()
	create_Cities()
	create_CityProducts()
	UpdateUI()


func UpdateUI():
	
	$CashLabel.text = "Cash: $" + str(cash)
	$FirmLabel.text = firm_name
	$CityLabel.text = "City: " + cities[current_city_index].city_name
	
	
func create_Cities():
	var city1 = city.new()
	city1.city_name = "Callao"
	cities.append(city1)
	
	var city2 = city.new()
	city2.city_name = "Chimbote"
	cities.append(city2)
	
	var city3 = city.new()
	city3.city_name = "Tumbes"
	cities.append(city3)

func create_Products():
	var product1 = product.new("llamas", 3, 23)
	var product2 = product.new("chicha", 1,13)
	
	products.append(product1)
	products.append(product2)
	

func create_CityProducts():
	for _city in cities:
		for _product in products:
			var _city_product = city_product.new(_city, _product)
			_city.city_products.append(_city_product)
		
func _on_ChimboteButton_pressed():
	current_city_index = 1
	UpdateUI()


func _on_TumbesButton_pressed():
	current_city_index = 2
	UpdateUI()


func _on_CallaoButton_pressed():
	current_city_index = 0
	
	
	UpdateUI()
