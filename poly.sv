class A;
int i=1;
virtual function void printMessage();
$display("\n This is the class A.");
$display("\n i = %0d", i);
endfunction
endclass
class B extends A;
int j=2;
virtual function void printMessage();
$display("This is the class B.");
$display("\n j = %0d", j);
endfunction
endclass
module Test;
A a; // Declare an object of A
B b; // Declare an object of B
initial begin
a = new(); // Create an instance of A object
b = new(); // Create an instance of B object
a.printMessage(); // Calls the function of A
b.printMessage(); // Calls the function of B
end
endmodule

