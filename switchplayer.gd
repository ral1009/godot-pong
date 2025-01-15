extends Button

@export var icons: Array[Texture2D] = []  
var current_icon_index: int = 0 

func _ready():
	if icons.size() > 0:
		self.icon = icons[current_icon_index]

	connect("pressed", Callable(self, "_on_pressed"))

func _on_pressed():
	if current_icon_index + 1 > 5:
		current_icon_index = -1
	PlayerSelection.selected_sprite = icons[current_icon_index+1]
	current_icon_index = (current_icon_index + 1) % icons.size()
	self.icon = icons[current_icon_index]
