#import "@preview/cetz:0.4.2"
#set page(height:auto,width:auto,margin:0mm)
#cetz.canvas(length:100mm,{
	import cetz.draw:*
	line((0,0),(.5,1))
	line((0,0),(1,.5))
	mark((.5,1),(1,2),symbol:">",fill:black)
	mark((1,.5),(2,1),symbol:">",fill:black)
	content((.5,1),anchor:"east",padding:2mm,$C_0$)
	content((1,.5),anchor:"north",padding:2mm,$C_1$)
	line((.5,1),(1,.5),stroke:(paint:gray,dash:"dashed"))
	line((0,0),(.7,.8),stroke:red)
	mark((.7,.8),(1.4,1.6),symbol:">",fill:red,stroke:red)
	content((.7,.8),anchor:"south-west",padding:1mm,$C'$)
})
