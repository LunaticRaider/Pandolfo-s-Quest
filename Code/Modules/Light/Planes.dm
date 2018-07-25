image
	master_plane
		plane = 0
		blend_mode = BLEND_MULTIPLY
		appearance_flags = PLANE_MASTER | NO_CLIENT_COLOR
		color = list(null,null,null,"#0000","#000f")
		mouse_opacity = 0

	darkness
		plane = -1
		blend_mode = BLEND_ADD
		mouse_opacity = 0
		icon = 'darkness.dmi'
		New()
			..()
			var/matrix/m = matrix()
			m.Scale(world.view*2.2)
			transform = m

obj
	light
		plane = -1
		blend_mode = BLEND_ADD
		icon = 'light.dmi'
		icon_state = "circle"
		mouse_opacity = 0

	lamp
		icon = 'lamp.dmi'
		icon_state = "off"
		density = 1
		var
			obj/light/light
			matrix
				on_matrix = matrix()
				off_matrix = matrix()
		New()
			..()
			light = new(src.loc)
			on_matrix.Scale(8)
			off_matrix.Scale(0)
			light.transform = off_matrix
			Toggle()
		Click()
			Toggle()
		proc/Toggle()
			if(icon_state == "off")
				icon_state = "on"
				animate(light,transform=on_matrix,time=5)
				sleep(6)
				animate(light,color=rgb(220,220,220),time=4,loop=-1)
			else
				icon_state = "off"
				animate(light,transform=off_matrix,time=5)
				light.color = null


mob
	var
		obj/light/light
		image
			darkness/darkness
			master_plane/master_plane
	Login()
		..()
		master_plane = new(loc=src)
		darkness = new/image/darkness(loc=src)
		src << master_plane
		src << darkness
		light = new(src.loc)
		light.alpha = 150
		darkness.alpha = 20
		var/matrix/m = new()
		m.Scale(2)
		light.transform = m

	Move()
		..()
		if(light) light.loc = src.loc
