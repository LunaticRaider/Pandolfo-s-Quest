turf/floor/wood
	name = "Wood Floor"
	icon_state = "woodfloor"
	edge_layer = 1

turf/floor/grass
	name = "Grass"
	icon_state = "grass1"
	edge_layer = 1
	New()
		..()
		icon_state = pick("grass1","grass2")

