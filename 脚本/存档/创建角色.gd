extends Button

var test = 1

onready var player_name = $"../LineEdit"
onready var animal = $"../../../../AnimationPlayer"

func _ready():
	if 数据.file.file_exists(数据.save_path):
		数据.file.open(数据.save_path, File.READ)
		数据.player = 数据.file.get_var()
		数据.file.close()
	
	pass

func _on_确认_pressed():
	if player_name.text == "":
		print(数据.player["Name"])
		数据.弹窗标题 = "警告"
		数据.弹窗内容 = "名称不能为空"
		print(数据.弹窗标题)
		print(数据.弹窗内容)
		弹窗.popup()
#		弹窗.$AnimationPlayer.play("出现")
		
	else:
		var dir = Directory.new()
		
		数据.player["Name"] = player_name.text
		数据.file.open(数据.save_path, File.WRITE)
		数据.file.store_var(数据.player)
		数据.file.close()
		animal.play("下一步")
		print(数据.player["Name"])
		get_tree().change_scene("res://资源/场景/Test.tscn")
	pass
