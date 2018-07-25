mob
	verb
	 Falar(msg as text)
	  world <<"<b>[usr]</b> diz  : [msg] " //Metodo de comunicação entre players, conversa.
	verb
	 Sorrir()
	  world << "<b>[usr]</b> sorri, mostrando seus dentes Colgate."

mob
  icon = 'critters.dmi'
  icon_state = "alien"
  Login()
    loc = locate(/turf/spawn)
    world << "<b>SISTEMA</b> : [usr] Se juntou a Pandolfo's Quest ! Lembre-se de entrar em nosso Discord! <b>https://discord.gg/bs4Ejfb</b>"
    usr << sound('Evelynn.mid',1)
    ..()