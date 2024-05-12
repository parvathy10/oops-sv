class P;
    int i; // Property to hold an integer value
endclass

class Q;
    int j;
    P a; // Object of class P as a member of class Q

    task automatic copy(P obj); // Task to perform the deep copy
        this.a = new();
        this.a = obj; // Deep copy
    endtask
endclass

module main;
    Q q1, q2, q3, q4; // Declare object q1, q2, q3, q4 of class Q

    initial begin
        // SHALLOW COPY ILLUSTRATION
        $display("\nShallow Copy Illustration:");
        
        // Creating q1
        q1 = new();
        q1.a = new();
        q1.a.i = 50;

        // Shallow copy q1 to q2
        q2 = new();
        q2.a = new();
        q2.a = q1.a; // Shallow copy

        // Modify q1.a.i and display values
        $display("\nBefore modifying q1.a.i:");
        $display("\nq1.a.i: %0d", q1.a.i); // Display the value of i in q1.a
        $display("q2.a.i: %0d", q2.a.i); // Display the value of i in q2.a

        q1.a.i = 60; // Modify value of i in q1.a

        $display("\nAfter modifying q1.a.i:");
        $display("\nq1.a.i: %0d", q1.a.i); // Display the value of i in q1.a
        $display("q2.a.i: %0d", q2.a.i); // Display the value of i in q2.a

        // DEEP COPY
        $display("\nDeep Copy Illustration:");
        
        // Creating q3
        q3 = new();
        q3.a = new();
        q3.a.i = 569;

        // Deep copy q3 to q4
        q4 = new();
        q4.copy(q3.a); // Call the copy task on q4 to perform a deep copy of q3.a into q4.a

        // Modify q4.a.i and display values
        $display("\nBefore modifying q4.a.i:");
        $display("\nq3.a.i: %0d", q3.a.i); // Display the value of i in q3.a
        $display("q4.a.i: %0d", q4.a.i); // Display the value of i in q4.a

        q4.a.i = 965; // Modify the value of i in q4.a

        $display("\nAfter modifying q4.a.i:");
        $display("\nq3.a.i: %0d", q3.a.i); // Display the value of i in q3.a
        $display("q4.a.i: %0d", q4.a.i); // Display the value of i in q4.a
    end
endmodule


