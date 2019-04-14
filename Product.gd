extends Node

# Declare member variables here. Examples:
var product_name = "[product name]"
var min_price = 3
var max_price = 23

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

func _init(_product_name, _min_price, _max_price):
	product_name = _product_name
	min_price = _min_price
	max_price = _max_price
	
func calculate_price():
	randomize()
	return int(rand_range(min_price, max_price))