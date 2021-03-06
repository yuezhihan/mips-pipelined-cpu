# MIPS Pipelined CPU

设计的创新点在于在硬件设计中使用了类似面向对象的思想，代码精简。

比方说，由于主要的线变量都是在流水线寄存器两端，所以直接使用寄存器内部变量的方式，用形如U_EX2MEM.cBranch的方式使用变量，避免了重复的变量定义，无需进行人工对应，使代码更加清晰明了，使得编码难度、调试难度和维护难度都大大降低。

## 详细设计

### PC（程序计数器）

当在始终周期上升沿或全局复位信号上升沿，更新指令地址PC为NPC，注意到由于NPC的计算需要时间，所以此处延时5ns。

### RF（寄存器）
首先清空寄存器。在每个时钟周期上升沿，检测并写入数据，并随时更新所读出的RD1和RD2的值。由于时钟周期刚开始的瞬间，所要写入的数据可能还未传送过来，所以延时了27ns。

### ALU（算术逻辑运算单元）

根据ALUOp的不同进行相应的计算，并更新ZERO。

### EXT（扩展单元）

判断EXTOp的类型，进行相应形式的符号扩展。

### DM（数据存储器）

在每个时钟周期上升沿，写入数据，并随时更新所读出的dout的值。

### IM（指令存储器）

用于读出指定地址处的指令。

### Ctrl（控制器）

根据OpCode和funct，实时生成各级控制信号。

### MIPS（模型机）

* 控制冒险模块在检测到分支时，直接RESET ID/EX EX/MEM级寄存器，并使IF/ID寄存器更新为新地址指令的数据，此后通过MUX得到NewPC，由于NewPC生成较慢，所以在PC中延时5ns，保证NewPC是最新的值。
* 阻塞单元在检测到lw指令时，会阻塞一个周期，即使得PC和IF/ID级数据不可写，并RESET ID/EX级，相当于在流水线中插入了一个NOP气泡。
* RF在数据生成后才能写入，在上升沿应该先得到要写入的数据才能让RF进行数据更新，所以延迟27ns解决这个问题。
* 旁路单元将数据从后两级转发过来，要特别注意优先级，即优先考虑上一条指令而不是上上条指令。

