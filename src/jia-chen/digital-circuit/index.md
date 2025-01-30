# DigitalCircuit

> 本关是一个由不同逻辑门（可能包含与非门、异或门等）构成的数字电路，包含 4 个输入端和 8 个输出端，初始输出为 `00000000`。
>
> 你需要通过合理输入，使得此电路能够输出 `11111111`。

本关的情况有点出乎意料，因为很多人过关不是依靠真的把题解出来，而是「一不小心碰出全 `1` 然后就通关了」，可见题目的复杂度还有待提升。我的预期好歹也是大家要测测电路，找找规律才行。

## 解析

这道题对于没学过数电的人来说并不友好，因为它不是一个简单的组合逻辑电路。在组合逻辑电路中，由确定的输入只会得出确定的输出。但在本题，你只要连续使用同样的输入来观测输出，就会发现输出结果是变化的。所以说，**这个电路很有可能是时序逻辑电路。**

具体的找规律过程就不提了，我直接说结果。

设输入为 $a_3a_2a_1a_0$，上一轮的输出为 $b_7b_6b_5b_4b_3b_2b_1$，本轮输出为 $c_7c_6c_5c_4c_3c_2c_1$，那么：

$c_7c_5c_3c_1$ 就等于你的输入，也就是说

$$c_7=a_3\\
c_5=a_2\\
c_3=a_1\\
c_1=a_0$$

$c_6$ 只有在「本次输入与上次输入（上次输入的结果间接记录在了上次输出当中）完全相反」时，才会得到 `1`；否则得到 `0`。

$c_4c_2$ 组成二位计数器，也就是说

$$c_4=b_4\oplus b_2\\
c_2=\neg b_2$$

$c_0$ 则等于所有输入 $a_k$、输出 $b_k$ 的异或和。

以下 C++ 代码可以实现由输入和上次输出推算本次输出。

```c++
std::array<bool,preset::OutputNum> operate::signal(std::array<bool,preset::InputNum> &input,std::array<bool,preset::OutputNum> &output){
	std::array<bool,preset::OutputNum> result;
	//result[7,5,3,1]记录了本次的输入
	result[7]=input[3];
	result[5]=input[2];
	result[3]=input[1];
	result[1]=input[0];
	//result[6]只有在「本次输入与上次输入完全相反」时，才会得到true
	result[6]=input[3]^output[7]&&input[2]^output[5]&&input[1]^output[3]&&input[0]^output[1];
	//result[4,2]组成二位计数器
	result[4]=output[4]^output[2];
	result[2]=!output[2];
	//result[0]等于所有输入、输出的异或和
	result[0]=false;
	for(int i=0;i<preset::InputNum;i++)
		result[0]^=input[i];
	for(int i=0;i<preset::OutputNum;i++)
		result[0]^=output[i];
	return result;
}
```

回到我们的问题。我们的初始状态是 `00000000`，而我们希望到达全 `11111111`，这其实就是一个在有向图上寻找路径的问题，那么无论做广度优先搜索还是求最短路都是可行的。

### 人工推导

当然，这题不编程也完全可以做，我们试着寻找一下思路：

就像走迷宫那样，有的时候从终点开始要比从起点开始更加容易。

要想达到 `11111111`，最后一步的输入必定要是 `1111`，因为输出当中就有四位数等于输入。

而我们又要保证 $c_6$ 等于 `1`，那么前一次的输入必须是 `0000` 才行。

同时，$c_4c_2$ 构成二位计数器，也就是说，在前一回合，它们的输出将是 $10$。

接下来的流程也可以照猫画虎地做，不过分岔会越来越多，很难逐个分析；因此我建议能编程的玩家还是试试编程求解一下。

### 编程求解

我们可以运用图论的知识建立一个有向图 $G(V,E)$，图上的点表示「输出的结果」，图中共有 $2^8=256$ 个点；边表示「经过一次输入，某个状态可以转移成另一个状态」，图中共有 $2^12=4096$ 条边。

我们还可以推断出这个图的一些特征，例如：因为有两位计数器每回合都会发生变化，所以任何一个状态在经历一次输入之后不可能返回它自身，因而 $G$ 中没有自环。（当然这是题外话了）

接下来就可以在图上搜索或者求最短路。我用的是 Floyd 算法。

```c++
#include<array>
#include<limits>
#include"operate.hpp"
#include"preset.hpp"
void operate::floyd(
	std::array<std::array<int,1<<preset::OutputNum>,1<<preset::OutputNum> &dist,
	std::array<std::array<int,1<<preset::OutputNum>,1<<preset::OutputNum> &prev
){
	for(int o=0;o<1<<preset::OutputNum;o++)
		for(int r=0;r<1<<preset::OutputNum;r++){
			dist[o][r]=std::numeric_limits<int>::max()/2;
			prev[o][r]=-1;
		}
	for(int o=0;o<1<<preset::OutputNum;o++){
		dist[o][o]=0;
		prev[o][o]=o;
		std::array<bool,preset::OutputNum> output;
		for(int d=0;d<preset::OutputNum;d++)
			output[d]=o&1<<d;
		for(int i=0;i<1<<preset::InputNum;i++){
			std::array<bool,preset::InputNum> input;
			for(int d=0;d<preset::InputNum;d++)
				input[d]=i&1<<d;
			std::array<bool,preset::OutputNum> result{operate::signal(input,output)};
			int r{0};
			for(int d=0;d<preset::OutputNum;d++)
				if(result[d])
					r+=1<<d;
			dist[o][r]=1;
			prev[o][r]=o;
		}
	}
	for(int k=0;k<1<<preset::OutputNum;k++)
		for(int i=0;i<1<<preset::OutputNum;i++)
			for(int j=0;j<1<<preset::OutputNum;j++)
				if(dist[i][j]>dist[i][k]+dist[k][j]){
					dist[i][j]=dist[i][k]+dist[k][j];
					prev[i][j]=prev[k][j];
				}
}
```

Floyd 算法应该是这里面最麻烦的了，不过我有不得不用的理由——那就是分析整个图的性质。

不过这些内容就是出题时需要考虑的了，如果我有空的话，之后会对此做进一步说明。
