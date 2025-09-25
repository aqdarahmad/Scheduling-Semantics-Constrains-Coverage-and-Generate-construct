module gen_if #(parameter use_case = 0 )(); 
generate
    
    if(use_case == 0)begin
        case0 :
        initial $display("Case 0 selected ");
    end

    
    if(use_case == 1)begin
        case0 :
        initial $display("Case 1 selected ");
    end
     
     else begin : default_case
     initial $display("Default Case selected ");
     end 
endgenerate
    
endmodule


module tb;
 gen_if #(0) u0();
 gen_if #(1) u1();
 gen_if #(5) u2();
endmodule

//////////
module gen_case #(parameter use_case = 2 )(); 
generate
     case(use_case)
     1: begin : mode1 
     initial $display("Mode 1");
     end
    
      2 : begin : mode2
      initial $display("Mode 2");
      end

      3: begin : mode_default 
      initial $display("Default Mode");
      end
     endcase
endgenerate
    
endmodule

module tb;
 gen_if #(0) u0();
 gen_if #(1) u1();
 gen_if #(5) u2();
endmodule