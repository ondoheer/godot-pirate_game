extends Node

var city = null
var product = null
var price = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _init(_city, _product):
	city = _city
	product = _product
	price = _product.calculate_price()
