# Blocking vs. Non-Blocking Assignment Demonstration in Verilog

## Overview

In this project, I implemented a Verilog module to demonstrate the difference between blocking and non-blocking assignment statements. My goal was to show how these assignment types affect the execution of sequential operations with delays, using two sets of integer variables (a, b, c for non-blocking and A, B, C for blocking). For example, with initial values a=10, b=20, c=15 and A=10, B=20, C=15, I performed operations like a <= #5 b+c, A = #5 B+C, and monitored the results to highlight the differences in behavior. I used a testbench with $monitor to display the variable values over time and confirmed the expected behavior through simulation.

Module: example





What I Did: I designed a module to compare blocking (=) and non-blocking (<=) assignments in Verilog.



Variables:





a, b, c: Integer variables for non-blocking assignments.



A, B, C: Integer variables for blocking assignments.



How It Works:





Initialization: In an initial block, I set a=10, b=20, c=15 and A=10, B=20, C=15.



Non-Blocking Assignments:





a <= #5 b+c: After 5ns, a is scheduled to be b+c (20+15=35).



b <= #5 a+5: After 5ns, b is scheduled to be a+5 (10+5=15).



c <= #5 a-b: After 5ns, c is scheduled to be a-b (10-20=-10).



Non-blocking assignments schedule updates at the end of the time step, using initial values for calculations.



At t=5ns, updates occur: a=35, b=15, c=-10.



Blocking Assignments:





A = #5 B+C: After 5ns, A is immediately set to B+C (20+15=35).



B = #5 A+5: After another 5ns (t=10ns), B is set to A+5 (35+5=40).



C = #5 A-B: After another 5ns (t=15ns), C is set to A-B (35-40=-5).



Blocking assignments execute sequentially, with each statement completing before the next begins.



Monitoring: An initial block with $monitor displays the values of a, b, c, A, B, C at each time step when changes occur.



Style: Behavioral modeling with initial blocks for simulation.

Testbench: testbench





What I Did: I used the example module itself as a testbench to demonstrate the assignments.



How It Works:





I initialized a, b, c, A, B, C to 10, 20, 15, respectively.



I applied non-blocking assignments (<=) to a, b, c with 5ns delays.



I applied blocking assignments (=) to A, B, C with 5ns delays.



I used $monitor to print the time and values of all variables whenever they change.



The simulation runs until all assignments complete (15ns for blocking, 5ns for non-blocking).



Time Scale: I set 1ns / 1ps for precise simulation timing.



Purpose: My testbench illustrates the parallel nature of non-blocking assignments versus the sequential nature of blocking assignments.

Files





example.v: Verilog module demonstrating blocking and non-blocking assignments.


## Simulation Waveform

Below is the simulation waveform, showing variables a, b, c, A, B, C over time.

![Screenshot 2025-06-22 213546](https://github.com/user-attachments/assets/ac0ef84f-e962-4fc0-b02a-6cdd726f6ce0)


## Console Output

Below is the console output from my testbench simulation.
  
![Screenshot 2025-06-22 213530](https://github.com/user-attachments/assets/6913c319-1bb1-4727-bfff-8620141fd675)





0 a=10 b=20 c=15 | A=10 B=20 C=15



5 a=35 b=15 c=-10 | A=35 B=20 C=15



10 a=35 b=15 c=-10 | A=35 B=40 C=15



15 a=35 b=15 c=-10 | A=35 B=40 C=-5
