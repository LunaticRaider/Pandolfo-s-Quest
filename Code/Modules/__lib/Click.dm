/*
	MOUSE DROP : QUANDO TU ARRASTA
	MOUSE DROP T : QUEM RECEBEU O MOUSE DROP
*/

/atom/MouseDrop(atom/over)
	if(!usr || !over) return
	spawn(0)
		over.MouseDrop_T(src,usr)
	return

// Receber um Mouse Drop
/atom/proc/MouseDrop_T(atom/dropping, mob/user)
	return
