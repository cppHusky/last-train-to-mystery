#import "@preview/cetz:0.4.2"
#set page(width:auto,height:auto,margin:0mm,fill:gray)
#cetz.canvas(
	length:.4mm,
	//x:(-10.0,10.0),
	//y:(20.0,0.0),
	//z:(0.0,20.0),
	{
		import cetz.draw:*
		line((0,0,0),(255,0,0),stroke:gradient.linear(black,rgb("ff0000"),angle:0deg))
		line((0,0,0),(0,255,0),stroke:gradient.linear(black,rgb("00ff00"),angle:270deg))
		line((0,0,0),(0,0,255),stroke:gradient.linear(black,rgb("0000ff"),angle:135deg))
		line((255,0,0),(255,255,0),stroke:gradient.linear(rgb("ff0000"),rgb("ffff00"),angle:270deg))
		line((255,0,0),(255,0,255),stroke:gradient.linear(rgb("ff0000"),rgb("ff00ff"),angle:135deg))
		line((0,255,0),(255,255,0),stroke:gradient.linear(rgb("00ff00"),rgb("ffff00"),angle:0deg))
		line((0,255,0),(0,255,255),stroke:gradient.linear(rgb("00ff00"),rgb("00ffff"),angle:135deg))
		line((0,0,255),(255,0,255),stroke:gradient.linear(rgb("0000ff"),rgb("ff00ff"),angle:0deg))
		line((0,0,255),(0,255,255),stroke:gradient.linear(rgb("0000ff"),rgb("00ffff"),angle:270deg))
		line((255,255,0),(255,255,255),stroke:gradient.linear(rgb("ffff00"),white,angle:135deg))
		line((255,0,255),(255,255,255),stroke:gradient.linear(rgb("ff00ff"),white,angle:270deg))
		line((0,255,255),(255,255,255),stroke:gradient.linear(rgb("00ffff"),white,angle:0deg))
		circle((255,255,255),r:.5,stroke:white,fill:white,name:"white")
		content("white",anchor:"south",padding:3,`ffffff`)
		circle((204,89,167),r:.5,stroke:rgb("cc59a7"),fill:rgb("cc59a7"),name:"cc59a7")
		content("cc59a7",anchor:"south",padding:3,`cc59a7`)
		line((255,255,255),(176.657,0,119.819),stroke:gradient.linear(white,rgb("b10078"),angle:90deg))
		circle((177,0,120),r:.5,stroke:rgb("b10078"),fill:rgb("b10078"),name:"b10078")
		content("b10078",anchor:"west",padding:3,`b10078`)
		circle((255,0,255),r:.5,stroke:rgb("ff00ff"),fill:rgb("ff00ff"),name:"ff00ff")
		content("ff00ff",anchor:"west",padding:3,`ff00ff`)
		circle((108,0,0),r:.5,stroke:rgb("6c0000"),fill:rgb("6c0000"),name:"6c0000")
		line((255,0,255),(107.667,0,0),stroke:gradient.linear(rgb("ff00ff"),rgb("6c0000"),angle:270deg))
		content("6c0000",anchor:"north-east",padding:3,`6c0000`)
		circle((255,0,0),r:.5,stroke:rgb("ff0000"),fill:rgb("ff0000"),name:"ff0000")
		content("ff0000",anchor:"north-east",padding:3,`ff0000`)
	}
)
