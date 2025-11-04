create_clock -name clk -period 40 [get_ports clk]


#aggiungi delay agli inputs
set_input_delay  -clock [get_clocks clk] -add_delay 10.0 [get_ports Data_in]
set_input_delay  -clock [get_clocks clk] -add_delay 10.0 [get_ports Sel_in]
set_input_delay -clock [get_clocks clk] -add_delay 10.0 [get_ports Sel_out]

#aggiunge delay agli outputs
set_output_delay -clock [get_clocks clk] -add_delay 10.0 [get_ports Data_out]


#aggiungiamo incertezza di clk e delay
set_clock_uncertainty -hold 0.3 [get_clocks clk]
set_clock_uncertainty -setup 0.5 [get_clocks clk]
set_clock_latency -source 10.0 [get_clocks clk]


#aggiungiamo un derate factor
set_timing_derate -cell_delay -early 0.90
set_timing_derate -cell_delay -late  1.10
 
# Applica un derate del 10% ai ritardi di rete
set_timing_derate -net_delay -early 0.90
set_timing_derate -net_delay -late  1.10
