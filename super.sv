class ParentClass;
int val = 2; // Property
function void display();
$display("Parent class display method");
endfunction
endclass
class SubClass extends ParentClass;
// Inherits the 'value' property and 'display' method from ParentClass.
int val = 50;
function void display();
super.display(); // Calls the 'display' method of the parent class
$display("Subclass display method & Value of Parent Class = %0d.",super.val);
$display("Subclass value Class = %0d.",this.val);
endfunction
endclass

module super_inher;
SubClass s;
initial begin
s=new();
s.display();
end
endmodule

