class P;
    // Declare property
    int i = 35;
    // Declare method
    function void display_A();
        $display("\n i = %0d", this.i);
    endfunction
endclass

class Q extends P;
    // Declare property
    int j = 99;
    // Declare method
    function void display_B();
        $display("\n j = %0d", this.j);
    endfunction
endclass

module inheritance;
    Q q;
    int p, r;
    initial begin
        q = new();
        p = q.i;
        r = q.j;
        $display("\n Display the value of i in P through Q");
        q.display_A;
        $display("\n Display the value of j in Q");
        q.display_B;
        q.i = 22;
        q.j = 77;
        $display("\n Display the value of i in P through Q");
        q.display_A;
        $display("\n Display the value of j in Q");
        q.display_B;
    end
endmodule

