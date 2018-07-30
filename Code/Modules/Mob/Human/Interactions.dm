#define INFINITY 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
#define MAX_PLEASURE 100

mob/var
	partner
	potenzia
	pleasure
	tired = 0

/obj/cleanable/cum
	name = "Semen"
	desc = "Cream pie ......... delicious"
	icon = 'interact.dmi'
	icon_state = "cum1"

	New()
		..()
		icon_state = pick("cum1","cum2","cum3","cum4","cum5","cum6","cum7","cum8","cum9","cum10","cum11","cum12")
		var/obj/light/cumLight = new(usr.loc)
		cumLight.color = rgb(255,255,255)
		cumLight.alpha = 200
		var/matrix/m = new()
		m.Scale(2)
		cumLight.transform = m
		animate(cumLight,color=rgb(255,255,255),alpha = 50,time=4,loop=5)
		sleep(50)
		del(cumLight)

	Click()
		view() << "<font color=blue>[usr] cleans up the [src.name]</font>"
		del(src)
		for(var/obj/light/L in src.loc)
			del(L)

/mob/living/MouseDrop_T(mob/M as mob, mob/user as mob)
	if(M == src || src == usr || M != usr)		return

	var/mob/living/H = usr
	H.partner = src
	usr << 	browse(null,"fuck")
	fug()

mob/proc/fuck()
	if(usr.tired == 0)
		var/p = usr.partner
		view() << "<font color=purple><b>[usr]</b> Bangs <b>[usr.partner]</b>'s ass</font>"
		usr.do_fucking_animation(p)
		usr.pleasure += 10
	else
		usr << "<font color=blue>You are too tired to do that.</font>"
	if(usr.pleasure >= 100)
		view() << "<big><font color=purple><b>[usr]</b> Cums!</font></big>"
		usr.pleasure = 0
		usr.ZOINKS()
		usr.light.color = rgb(255,61,203)
		usr.light.alpha = 170
		usr.tired = 1
		var/obj/cleanable/cum/C = new(usr.loc)
		C.name = "Semen"
		sleep(500)
		usr.tired = 0
		usr.light.color = rgb(255,192,115)
		usr.light.alpha = 150
mob/proc/fug()
	var/erpHTML ={"
	<Title> ERP </Title>
	<Body style="background-color: #dfdfdf;">
	<p>Select an action</p>
	<a href='?src=\ref[src];action=sex' class="aButton">
	Anal (10 . 15)
	</a>
	</Body>
	"}
	usr<<browse(erpHTML,"window=sex")

/*
mob/verb/test()
	usr << "Click <a href='?src=\ref[src];action=startgame'>here</a>!"

mob/Topic(href,href_list[])
	switch(href_list["action"])
		if("startgame")
			usr << "Starting game..."
		if("sex")
			usr.fuck()
*/

/mob/proc/do_fucking_animation(mob/living/P)
	var/pixel_x_diff = 0
	var/pixel_y_diff = 0
	var/final_pixel_y = initial(pixel_y)

	var/direction = get_dir(src, P)
	if(direction & NORTH)
		pixel_y_diff = 8
	else if(direction & SOUTH)
		pixel_y_diff = -8

	if(direction & EAST)
		pixel_x_diff = 8
	else if(direction & WEST)
		pixel_x_diff = -8

	if(pixel_x_diff == 0 && pixel_y_diff == 0)
		pixel_x_diff = rand(-3,3)
		pixel_y_diff = rand(-3,3)
		animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
		animate(pixel_x = initial(pixel_x), pixel_y = initial(pixel_y), time = 2)
		return

	animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
	animate(pixel_x = initial(pixel_x), pixel_y = final_pixel_y, time = 2)