/mob/client/Login()
	src.loc = locate(8,9,2)
	var/race = input("Enter your race")in list("Xeno","Human","Drak")
	if(race)
		if(race == "Xeno")
			var/mob/living/xeno/p = new(1,1,1)
			p.ckey = src.ckey
