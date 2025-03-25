extends Node2D
var LevelFinished = false
var Aimed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var bFired = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var Barrel = get_node("Barrel")
	if LevelFinished == false:
		if bFired == false:
			if Aimed == false:
				BarrelMove(delta, Barrel)
			if Aimed == true:
				FirePower(delta, Barrel)
	pass

var BarrelMoveAngle = 45

func BarrelMove(delta, Barrel):
	if Barrel.rotation_degrees >= -1:
		get_node("MoveSound").play()
	if Barrel.rotation_degrees > -90 && Barrel.rotation_degrees < 0:
		Barrel.rotation_degrees += BarrelMoveAngle * delta
	else:
		BarrelMoveAngle *= -1
		Barrel.rotation_degrees += BarrelMoveAngle * delta
	Barrel.rotation_degrees = clamp(Barrel.rotation_degrees, -91, 1)
	if Input.is_action_pressed("ui_accept"):
		get_node("MoveSound").set_stream_paused(true)
		await get_tree().create_timer(0.2).timeout 
		Aimed = true
	pass


var Charge = 2
var ChargeChange = 50
func FirePower(delta, Barrel):
	if Charge > 1 && Charge < 100:
		Charge += ChargeChange * delta
		Charge = clamp(Charge, 0, 101)
	else:
		ChargeChange *= -1
		Charge += ChargeChange * delta
	get_node("Star").material.set_shader_parameter("Charge",Charge)
	if Input.is_action_pressed("ui_accept"):
		Fired(Charge,Barrel)
	pass

var Cat = preload("res://Scenen/projectile.tscn")

func Fired(Charge, Barrel):
	bFired = true
	var Projectile = Cat.instantiate()
	var Direction = Vector2.RIGHT.rotated(Barrel.rotation)
	Direction *= Vector2(Charge*20+200,Charge*20+200)
	Projectile.set_linear_velocity(Direction)
	get_node("Body").add_child(Projectile)
	get_node("FireSound").play()
	get_node("Barrel/Particles").emitting = true
	await get_tree().create_timer(5).timeout
	bFired = false
	Aimed = false
	get_node("MoveSound").set_stream_paused(false)
	pass
