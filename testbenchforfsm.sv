module tb ;
logic clk , reset , start;
logic [1:0] start;


fsm uut(.clk(clk) , .reset(reset),.start(start),.state(state));
    


 initial clk = 0;
 always #5 clk=~clk;



 class fsm_cov;
   covergroup cg @(posedge clk);

     coverpoint state {
           bins idle_bin = {0};
                bins run_bin  = {1};
                bins done_bin = {2};
     }

     coverpoint state => state {
          ignore_bins idle_to_idle = (0=>0);
     }

     
   endgroup

   fsm_cov () {cg = new();}
   cg cg;
 endclass 

fsm_cov cov_inst;

initial begin
    cov_inst = new();

    reset = 1 ;
     start = 0;
     #10 reset = 0;

     repeat(10)begin
          start = $urandom_range(0,1); 
            #10;
            cov_inst.cg.sample(); 
     end
  $display("FSM simulation done!");
        $finish;


end

endmodule