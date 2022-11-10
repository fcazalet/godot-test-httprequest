extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	do_request()


func do_request():
	var request = HTTPRequest.new()
	request.use_threads = true
	add_child(request)
	var err = request.request("http://www.mocky.io/v2/5185415ba171ea3a00704eed")
	if err == OK:
		var args = yield(request, "request_completed")
		print("request done")
		request.queue_free()
