//without genreate block

module shift (
    input wire clk ;
    output wire q; 
);
wire [7:0] p;

reg [3:0] count = 4'd0;
always @(posedge clk) begin
    count <= count + 4'd1;
end

assign p[0] = count[3];

reg [7:0] preg;

always @(posedge clk) begin
    preg[1] <= p[0];
     preg[2] <= p[1];
        preg[3] <= p[2];
        preg[4] <= p[3];
        preg[5] <= p[4];
        preg[6] <= p[5];
        preg[7] <= p[6];
end
assign p[7:1] = preg[7:1];
assign q = p[7];
    
endmodule

//with generate block
module dflop(
    input  wire clock,
    input  wire d,
    output wire q
);

    reg out;
    always @(posedge clock) begin
        out <= d;
    end

    assign q = out;
endmodule
module shift (
    input  wire clock,   // clock input
    output wire q        // output of shift register
);

    wire [7:0] p;

    reg [3:0] count = 4'd0;
    always @(posedge clock) begin
        count <= (count + 4'd1);
    end

    assign p[0] = count[3];  

  
    generate
        genvar n;
        for (n = 0; n <= 6; n = n + 1) begin: flopGen
            dflop u (
                .clock(clock),
                .d(p[n]),
                .q(p[n+1])
            );
        end
    endgenerate

    assign q = p[7];
endmodule
