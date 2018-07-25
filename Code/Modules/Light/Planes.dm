// The guts of the system.

// NOTE: This can also be done without the darkness plane, by putting the master_plane and light sources on the same plane (eg: 2)
// However, this will cause things to be interlayered in a way that will make players running in software rendering mode able to see fully as if no darkness existed.
// This method will give them a fully black screen with no advantage.

image
	master_plane
		// I place the master plane on 0 so it'll on the default plane of most everything in the game.
		// If things exist above plane 0, they'll appear above the master.
		plane = 0
		blend_mode = BLEND_MULTIPLY // Anything covered by this will have its color multiplied as they blend.
		appearance_flags = PLANE_MASTER | NO_CLIENT_COLOR // Specifies the plane is a master and it will ignore client.color values.
		color = list(null,null,null,"#0000","#000f") // Sets a color matrix to pure black with full alpha.
		mouse_opacity = 0 // Makes sure all mouse events ignore the plane.

	darkness
		// The darkness will appear behind the master plane and cover the entire screen
		// I do it this way to allow finer control over the alpha levels and color of the "darkness" players see on their screen.
		// In reality it's just a scaled-up white block.
		plane = -1
		blend_mode = BLEND_ADD // Any color value applied to this image will be added to the color of anything blending with it.
		mouse_opacity = 0
		icon = 'darkness.dmi'
		New()
			..()
			var/matrix/m = matrix()
			m.Scale(world.view*2.2)
			transform = m
			// Scaling it up to cover the screen, I can probably use a single screen object for this...
			// ... but I've found some cool screen-wide effects you can pull off by using a single graphic.



obj
	light
		plane = -1
		blend_mode = BLEND_ADD
		icon = 'light.dmi'
		icon_state = "circle"
		mouse_opacity = 0
		// The light and darkness share a plane and most traits, when adding the pure white color of the light, and its alpha values.
		// And the color and alpha values of the darkness image...
		// ... you end up blending away the master plane's blacking out of the view.

	lamp
		icon = 'lamp.dmi'
		icon_state = "off"
		density = 1
		// A basic light source object.
		var
			obj/light/light
			matrix
				on_matrix = matrix()
				off_matrix = matrix()
		New()
			// With some fancy turning off and on animation...
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
				// And flickering...
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
