obj/item/verb/pickup()
	src.loc = usr

obj/item/verb/drop()
	src.loc = usr.loc

obj/item/Click()
	if(src.loc != usr)
		src.pickup()
	else
		src.loc = usr.loc