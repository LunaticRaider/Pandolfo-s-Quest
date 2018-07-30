turf
	var/list/destroy
	var/neighbors[]

	proc/clicked()

turf/floor

	var/edge_layer = 1
	var/edges

	icon = 'floors.dmi'
	icon_state = "wood"
	density = 0
	opacity = 0

	proc/edges()
		var/scanX = -1
		var/scanY = 0
		for(var/R = 0,R < 4,R++)
			var/turf/floor/T = locate(src.x+scanX,src.y+scanY,src.z)
			if(T.edge_layer > src.edge_layer)
				if(!(T.edges == null))
					var/image/I = image('floors.dmi',src,icon_state=T.edges,dir=get_dir(src,T))
					src.overlays += I

			if(scanX == -1 && scanY == 0)
				scanX++
				scanY++
			else if(scanX == 0 && scanY == 1)
				scanY -= 2
			else if(scanX == 0 && scanY == -1)
				scanY++
				scanX++

	New()
		..()
		edges()