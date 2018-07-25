mob
	step_size = 32

mob/player
	verb
	 Falar(msg as text)
	  oview() <<"<b>[usr]</b> diz  : [msg] " //Metodo de comunicação entre players, conversa.
	verb
	 Sorrir()
	  world << "<b>[usr]</b> sorri, mostrando seus dentes." //Só aceitamos responsabilidade

mob/player
  icon = 'critters.dmi'
  icon_state = "alien"
  Login()
    loc = locate(/turf/spawn)
    world << "<b>SISTEMA</b> : [usr] Se juntou a Pandolfo's Quest ! Lembre-se de entrar em nosso Discord! <b>https://discord.gg/bs4Ejfb</b>"
    usr << sound('Evelynn.mid',1)
    ..()