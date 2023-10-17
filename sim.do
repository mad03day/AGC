
###########################
# Simple modelsim do file #
###########################

# Delete old compilation results
if { [file exists "work"] } {
    vdel -all
}

# Create new modelsim working library
vlib work

# Compile all the Verilog sources in current folder into working library
vlog  AGC.v Env_Approx.v Accumulator.v Err_gen.v Float_emm.v Integrator.v testbench.v

# Open testbench module for simulation
vsim work.testbench

# Add all testbench signals to waveform diagram
add wave sim:/testbench/*
#add wave sim:/testbench/agc/*
#add wave sim:/testbench/agc/ACC/*
#add wave sim:/testbench/agc/Err/*
#add wave sim:/testbench/agc/float_emulation/*
add wave sim:/testbench/agc/ACC_Int/*
onbreak resume
# Run simulation
run -all
wave zoom full
