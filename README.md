Project Description: Designing an Intelligent Irrigation System
Objectives:

• Implementing an FPGA-based intelligent irrigation system in VHDL language

• Familiarity with the implementation of segment-seven

• Understanding the concept of process and sequential statements in VHDL language

• Understanding how to use Clock

• Employing and implementing Finite State Machines (FSM)



In this system, there are 3 sensors for humidity, temperature, and light. The humidity sensor has a 3-bit output representing humidity levels 7-0. The temperature and light sensors check for ideal conditions and each output is indicated in a single bit. Ideal conditions occur when the outputs of both temperature and light sensors are 0, and in other cases, ideal conditions are not met.

When in state 0 (ST - when irrigation is not happening), there are four possible scenarios:
- If ideal conditions are met and humidity level is greater than 3, the system remains in state 0.
- If ideal conditions are met and humidity level is less than or equal to 3, the system transitions from state 0 to state 1 (ST - irrigation).
- If ideal conditions are not met and humidity level is less than or equal to 1, the system transitions from state 0 to state 1.
- If ideal conditions are not met and humidity level is greater than 1, the system remains in state 0.

When in state 1 (ST - when irrigation is happening), there are four possible scenarios as well.
- If ideal conditions are met and humidity level is less than 7, the system remains in state 1.
- If the humidity level is greater than or equal to 7, the system transitions from state 1 to state 0.
- If ideal conditions are not met and humidity level is less than 3, the system remains in state 1.
- If ideal conditions are not met and humidity level is greater than or equal to 3, the system transitions from state 1 to state 0.

The output Seg when the system is in state 1 should display the LED Segment7- values, which correspond to the character 'H', and when the system is in state 0, it should display a value equivalent to '-'.



