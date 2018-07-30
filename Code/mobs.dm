mob
	step_size = 32

mob/living
	verb
	 Falar(msg as text)
	  view() <<"<b>[usr]</b> diz  : [msg] " //Metodo de comunica��o entre players, conversa.
	verb
	 Sorrir()
	  view() << "<b>[usr]</b> sorri, mostrando seus dentes." //So respnosadibli

mob/living
  icon = 'critters.dmi'
  icon_state = "alien"
  Login()
    loc = locate(/turf/spawn)
    world << "<b>SISTEMA</b> : [usr] Se juntou a Pandolfo's Quest ! Lembre-se de entrar em nosso Discord! <b>https://discord.gg/FEmaUfr</b>"
    usr << sound('Evelynn.mid',1)
    ..()

mob/var
	hp = 100
	maxhp = 100
	mp = 100
	maxmp = 100

mob/living/Login()
	..()
	name = input("Coloque seu nome:")
	gender = "male"

//GHOST

mob/ghost
  icon = 'critters.dmi'
  icon_state = "familiar"

mob/verb/who()
   set category = "Utility"
   var/mob/M
   for(M in world)
      if(!M.key) continue
      if(M.key == usr.key) continue
	  usr << "<b>Presente no mundo:</b>"
	  usr << "<b>[M.name] ([M.key])<b>"