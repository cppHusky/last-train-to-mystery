#import "@preview/cetz:0.4.2"
#set page(width:auto,height:auto,margin:0mm,fill:gray)
#cetz.canvas(
	length:.4mm,
	{
		import cetz.draw:*
		circle((61,226,242),r:.5,stroke:rgb("3de2f2"),fill:rgb("3de2f2"),name:"3de2f2")
		circle((245,245,68),r:.5,stroke:rgb("f5f544"),fill:rgb("f5f544"),name:"f5f544")
		circle((204,89,167),r:.5,stroke:rgb("cc59a7"),fill:rgb("cc59a7"),name:"cc59a7")
		circle((0,75,43),r:.5,stroke:rgb("004b2b"),fill:rgb("004b2b"),name:"004b2b")
		circle((111,159,120),r:.5,stroke:rgb("6f9f78"),fill:rgb("6f9f78"),name:"6f9f78")
		line("3de2f2","f5f544",stroke:gradient.linear(rgb("3de2f2"),rgb("f5f544"),angle:0deg))
		line("3de2f2","cc59a7",stroke:gradient.linear(rgb("3de2f2"),rgb("cc59a7"),angle:0deg))
		line("3de2f2","004b2b",stroke:gradient.linear(rgb("3de2f2"),rgb("004b2b"),angle:90deg))
		line("f5f544","004b2b",stroke:gradient.linear(rgb("f5f544"),rgb("004b2b"),angle:90deg))
		line("f5f544","cc59a7",stroke:gradient.linear(rgb("f5f544"),rgb("cc59a7"),angle:180deg))
		line("004b2b","cc59a7",stroke:gradient.linear(rgb("004b2b"),rgb("cc59a7"),angle:0deg))
		circle((165,200,158),r:.5,stroke:rgb("a5c89e"),fill:rgb("a5c89e"),name:"a5c89e")
		line("004b2b",(165.435,200.194,157.761),stroke:gradient.linear(rgb("004b2b"),rgb("a5c89e")))
		circle((229,184,107),r:.5,stroke:rgb("e4b86a"),fill:rgb("e4b86a"),name:"e4b86a")
		line("3de2f2",(228.970,184.008,106.332),stroke:gradient.linear(rgb("3de2f2"),rgb("e4b86a")))
	}
)
