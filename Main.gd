extends Panel

# Declare member variables here. Examples:
var cash = 250
var firm_name = "Ondoheer's Pirate Trader"

var city = preload("res://City.gd")
var product = preload("res://Product.gd")
var city_product = preload("res://CityProduct.gd")

var product_panel = preload("res://ProductPanel.tscn")

var city_data = [
	{
		'name': 'Callao'
	},
	{
		'name': 'Chimbote'
	},
	{
		'name': 'Tumbes'
	}
]

var product_data = [
	{
		'name':'Llamas',
		'min_price': 3,
		'max_price': 23
	},
	{
		'name':'Chicha',
		'min_price': 1,
		'max_price': 7
	},
	{
		'name':'Tuna',
		'min_price': 2,
		'max_price': 6
	},
	{
		'name':'Aguaymanto',
		'min_price': 5,
		'max_price': 13
	},
]
var cities = []
var current_city_index = 0

var products = []

# Signals
signal ARRIVE_AT_PORT

# Called when the node enters the scene tree for the first time.
func _ready():
	create_Products()
	create_ProductPanels()
	create_Cities()
	create_CityProducts()
	arrive_at_port()
	UpdateUI()


func UpdateUI():
	
	$CashLabel.text = "Cash: $" + str(cash)
	$FirmLabel.text = firm_name
	$CityLabel.text = "City: " + cities[current_city_index].city_name
	
	
func create_Cities():
	for _city in city_data:
		var temp_city = city.new()
		temp_city.city_name = _city.name
		cities.append(temp_city)
	
	

func create_Products():
	for _product in product_data:
		var temp_product = product.new(_product.name, _product.min_price, _product.max_price)
		products.append(temp_product)
	
func create_ProductPanels():
	for _product in products:
		var _product_panel = product_panel.instance()
		_product.product_panel = _product_panel
		_product_panel.init(_product)
		_product_panel.UpdateUI(_product.product_name)		
		$ProductListContainer.add_child(_product_panel)
		
func create_CityProducts():
	for _city in cities:
		for _product in products:
			var _city_product = city_product.new(self, _city, _product)
			_city.city_products.append(_city_product)

func arrive_at_port():
	emit_signal("ARRIVE_AT_PORT", cities[current_city_index])
	
		
		
func depart_from_city(_destination_index):
	if current_city_index != _destination_index:
		current_city_index = _destination_index
		# check for pirates
		arrive_at_port()
		UpdateUI()
	else:
		print("this is the same city you are not travelling")




