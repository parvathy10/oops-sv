module CLASS_CPT;
class packet;
bit [3:0] data;
bit [1:0] address;
bit [3:0] memory [0:3];
function new();
foreach(memory[i])
memory[i] = i;
endfunction
function void WriteMem(input [1:0] addr, input [3:0] val);
memory[addr] = val;
endfunction

function void ReadMem(input bit [1:0] addr);
$display("Data at memory address %0d: %0d", addr, memory[addr]);
endfunction
function void Display();
$display("Data: %0d", data);
$display("Address: %0d", address);
endfunction
endclass: packet
packet pkt_h1, pkt_h2;
int i;
initial begin
pkt_h1 = new();
pkt_h2 = new();
$display("Before writing to memory:");
for(i=0;i<4;i++)
pkt_h1.ReadMem(i);
pkt_h1.data = $urandom_range(16);
pkt_h1.address = $urandom_range(4);
pkt_h1.WriteMem(pkt_h1.address, pkt_h1.data);
$display("After writing to memory:");
for(i = 0;i<4;i++)
pkt_h1.ReadMem(i);
pkt_h1.Display();
// Assign pkt_h1 to pkt_h2
pkt_h2 = pkt_h1;
// Display the values of data and address of pkt_h1 and pkt_h2

$display("pkt_h1:");
pkt_h1.Display();
$display("pkt_h2:");
pkt_h2.Display();
// Modify the values of data and address using pkt_h2
pkt_h2.data = $urandom_range(16);
pkt_h2.address = $urandom_range(4);
// Display the values of data and address of pkt_h1 and pkt_h2
$display("pkt_h1:");
pkt_h1.Display();
$display("pkt_h2:");
pkt_h2.Display();
end
endmodule