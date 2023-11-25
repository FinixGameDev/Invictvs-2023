extends Level

var count = 1

func _ready():
	progress.connect(switch_anim)

func switch_anim():
	count = (count + 1) % 5
	handanim = "6-mao_" + str(count)
	
