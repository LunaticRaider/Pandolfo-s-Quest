mob
	verb
	 Falar(msg as text)
	  world <<"<b>[usr]</b> diz  : [msg] " //Metodo de comunicação entre players, conversa.
	verb
	 Sorrir()
	  world << "<b>[usr]</b> sorri, mostrando seus dentes Colgate."

mob
  icon = 'player.dmi'
  Login()
    loc = locate(/turf/bed)
    world << "<b>SISTEMA</b> : [usr] Se juntou a Pandolfo's Quest ! Lembre-se de entrar em nosso Discord! <b>https://discord.gg/bs4Ejfb</b>"
    usr << sound('town.ogg',1)
    ..()