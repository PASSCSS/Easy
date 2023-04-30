extends RigidBody

var speed : int = 16 # int переменая может содержать только целые числа
var impulse : Vector3 = Vector3() # vector переменая может хранить только координаты 2D и 3D

func _ready(): # эта функция срабатывает при первом рендере ноды
	$Position3D.set_as_toplevel(true) # в этой строчке мы перестаём наследывать transform.origion радителя

func _physics_process(delta): # эта функция срабатывает при каждом рендере ноды
	$Position3D.transform.origin = transform.origin # тут мы задаём позицию камеры чтобы она двигалась за мячиком

	# тут мы задаём вектор impulse.x при нажатии на left impulse.x равен 1 если на right -1 и так же для z координаты
	# тоесть если мы хотим двигатся вверхний правый угол то impulse будет равен Vector3(-1, 0, 1)
	# y координата равна нули потомучто в случае равенства её 1 мячик будет подниматся вверх
	impulse = Vector3(Input.get_axis("ui_left", "ui_right"), 0, Input.get_axis("ui_up", "ui_down")) * speed
	apply_central_impulse(impulse / 64) # тут мы задаём импульс 
