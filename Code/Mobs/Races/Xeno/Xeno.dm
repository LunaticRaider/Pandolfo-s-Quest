#define XENO_PLASMA_MULTIPLIER 0.50
#define XENO_PLASMA_NORMAL 0.10

mob/living/xeno
	var/plasma = 500
	var/maxplasma = 500

mob/living/xeno/Stat()
	..()
	stat("Plasma:","[plasma] / [maxplasma]")

mob/living/xeno/verb/plantWeeds()
	set name = "Plant Weeds (50)"
	set category = "Xeno"

	plasma -= 50
	if(plasma > 0)
		light = new(src.loc)
		light.alpha = 150
		light.color = rgb(105,87,130)
		var/matrix/m = new()
		m.Scale(3)
		light.transform = m
		var/turf/floor/weeds/w = new(src.loc)
		w.name = "Alien Weeds"
		w.edges()
	regenPlasma()

mob/living/xeno/verb/resinFloor()
	set name = "Make a Resin Floor (80)"
	set category = "Xeno"

	plasma -= 80
	if(plasma >0)
		var/turf/floor/resin/r = new(src.loc)
		r.edges()
	regenPlasma()


mob/living/xeno/proc/regenPlasma()
	plasma += 10 / XENO_PLASMA_MULTIPLIER
	if(plasma >500)
		plasma = 500
	sleep(10)
	plasma -= 10

mob/living/xeno/Move()
	..()
	regenPlasma()