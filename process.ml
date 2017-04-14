type name = string 

type proc = Sync of evt 
and evt = 
	| Null 
	| Choice of evt * evt
	| Query of name * proc
	| Signal of name * proc

let _ = print_string "Running...\n"
let rec vending_proc = Sync(Query("2p", Sync(Choice(Signal("tea", vending_proc), Query("2p", Sync(Signal("cof", vending_proc)))))))
let _ = print_string "Complete\n"
