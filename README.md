SystemVerilog Verification Concepts Examples
Overview

This project demonstrates key SystemVerilog verification concepts, including:

Scheduling – controlling the order of event execution in simulation.

Semantics – understanding the behavior of procedural statements and assignments.

Constraints – restricting random variable values for verification.

Coverage – measuring which scenarios or states have been tested.

Generate Construct – creating repetitive or parameterized hardware structures efficiently.

Features
1. Scheduling

Shows how events are executed in different simulation regions (active, inactive, NBA).

Example:

initial begin
    $display("Step 1");
    #1 $display("Step 2 after 1 time unit");
end

2. Semantics

Demonstrates blocking vs non-blocking assignments:

always @(posedge clk) begin
    a = b;    // blocking
    c <= d;   // non-blocking
end

3. Constraints

Defines random variable restrictions for verification:

class Packet;
    rand bit [7:0] addr;
    rand bit [7:0] data;

    constraint addr_c { addr < 100; }
    constraint data_c { data inside {[0:10], [20:30]}; }
endclass

4. Coverage

Tracks which scenarios or states are exercised:

covergroup cg @(posedge clk);
    coverpoint opcode;
endgroup

cg cg1 = new();
cg1.sample();

5. Generate Construct

Creates repetitive or parameterized hardware structures:

genvar i;
generate
    for(i=0; i<8; i=i+1) begin : gen_loop
        assign out[i] = in[i] & enable;
    end
endgenerate

Files

scheduling_example.sv – Scheduling demonstration.

semantics_example.sv – Blocking/non-blocking and procedural behavior.

constraints_example.sv – Randomized class with constraints.

coverage_example.sv – Covergroups and sampling.

generate_example.sv – Generate constructs for repetitive structures.

Simulation Instructions

Compile the examples using a SystemVerilog simulator:

xrun scheduling_example.sv
xrun semantics_example.sv
xrun constraints_example.sv
xrun coverage_example.sv
xrun generate_example.sv


Observe the console output or waveform to study behavior.

Notes

Designed for learning advanced verification concepts in SystemVerilog.

Useful for students and engineers preparing for UVM or SystemVerilog-based verification projects.

Shows best practices for randomization, coverage, and hardware generation.
