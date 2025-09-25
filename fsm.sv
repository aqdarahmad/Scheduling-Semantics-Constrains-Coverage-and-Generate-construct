module fsm (
input logic clk,
input logic reset,
input logic start,
output logic [1:0] state
);

typedef enum logic [1:0] {IDLE = 0 , RUN=1,DONE=2  } state_t;
state_t current_state , next_state;

always_ff @(posedge clk or posedge reset) begin
    if(reset)
    current_state <= IDLE;
    else 
    current_state <= next_state;
end


always_comb begin
    next_state = current_state;
    case(current_state)
    IDLE: if(start) next_state = RUN;
    RUN : next_state = DONE;
    DONE : next_state = IDLE;
    endcase
end

assign state = current_state;
    
endmodule