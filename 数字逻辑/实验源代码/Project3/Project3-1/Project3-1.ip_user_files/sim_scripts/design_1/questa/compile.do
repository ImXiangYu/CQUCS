vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr -mfcu \
"../../../bd/design_1/ipshared/ee7c/andgate.v" \
"../../../bd/design_1/ip/design_1_andgate_0_0/sim/design_1_andgate_0_0.v" \
"../../../bd/design_1/ipshared/811e/notgate.v" \
"../../../bd/design_1/ip/design_1_notgate_0_0/sim/design_1_notgate_0_0.v" \
"../../../bd/design_1/ip/design_1_notgate_1_0/sim/design_1_notgate_1_0.v" \
"../../../bd/design_1/ipshared/0f02/orgate.v" \
"../../../bd/design_1/ip/design_1_orgate_0_0/sim/design_1_orgate_0_0.v" \
"../../../bd/design_1/ip/design_1_andgate_1_0/sim/design_1_andgate_1_0.v" \
"../../../bd/design_1/ip/design_1_orgate_1_0/sim/design_1_orgate_1_0.v" \
"../../../bd/design_1/ip/design_1_orgate_2_0/sim/design_1_orgate_2_0.v" \
"../../../bd/design_1/ip/design_1_andgate_1_1/sim/design_1_andgate_1_1.v" \
"../../../bd/design_1/ip/design_1_andgate_0_1/sim/design_1_andgate_0_1.v" \
"../../../bd/design_1/ip/design_1_andgate_0_2/sim/design_1_andgate_0_2.v" \
"../../../bd/design_1/ip/design_1_andgate_0_3/sim/design_1_andgate_0_3.v" \
"../../../bd/design_1/ip/design_1_andgate_2_0/sim/design_1_andgate_2_0.v" \
"../../../bd/design_1/ip/design_1_andgate_2_1/sim/design_1_andgate_2_1.v" \
"../../../bd/design_1/sim/design_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

