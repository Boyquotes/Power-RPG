extends Node

func _init():
	mmkv.initMMKV("厉害RPG", "save.save")

func save(key:String, value):
	if value.typeof() == TYPE_REAL:
		mmkv.setFloat(key, value)
	elif value.typeof() == TYPE_STRING:
		mmkv.setString(key, value)
	elif value.typeof() == TYPE_BOOL:
		mmkv.setBool(key, value)
	elif value.typeof() == TYPE_INT:
		save(key, float(value))
	elif value.typeof() == TYPE_DICTIONARY:
		mmkv.setDict(key, value)
	
func load_save(key, value):
	if value.typeof() == TYPE_REAL:
		mmkv.getFloat(key)
	elif value.typeof() == TYPE_STRING:
		mmkv.getString(key)
	elif value.typeof() == TYPE_BOOL:
		mmkv.getBool(key)
	elif value.typeof() == TYPE_INT:
		load_save(key, float(value))
	elif value.typeof() == TYPE_DICTIONARY:
		mmkv.getDict(key)

