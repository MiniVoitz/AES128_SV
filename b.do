onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {interface} -radix hexadecimal /interfaceAES_tb/clk
add wave -noupdate -expand -group {interface} -radix hexadecimal /interfaceAES_tb/reset
add wave -noupdate -expand -group {interface} -radix hexadecimal /interfaceAES_tb/crypte
add wave -noupdate -expand -group {interface} -radix hexadecimal /interfaceAES_tb/RW
add wave -noupdate -expand -group {interface} -radix hexadecimal /interfaceAES_tb/adress
add wave -noupdate -expand -group {interface} -radix hexadecimal /interfaceAES_tb/message
add wave -noupdate -expand -group {interface} -radix hexadecimal /interfaceAES_tb/key
add wave -noupdate -expand -group {interface} -radix hexadecimal /interfaceAES_tb/initiate
add wave -noupdate -expand -group {interface} -radix hexadecimal /interfaceAES_tb/data
add wave -noupdate -expand -group {interface} -radix hexadecimal /interfaceAES_tb/data_in
add wave -noupdate -expand -group {interface} -radix hexadecimal /interfaceAES_tb/data_out
add wave -noupdate -expand -group {fsm} /interfaceAES_tb/dut/fsmInterface_1/initiate
add wave -noupdate -expand -group {fsm} /interfaceAES_tb/dut/fsmInterface_1/RW
add wave -noupdate -expand -group {fsm} /interfaceAES_tb/dut/fsmInterface_1/adress
add wave -noupdate -expand -group {fsm} /interfaceAES_tb/dut/fsmInterface_1/load
add wave -noupdate -expand -group {fsm} /interfaceAES_tb/dut/fsmInterface_1/CS
add wave -noupdate -expand -group {fsm} /interfaceAES_tb/dut/fsmInterface_1/shift_in_message
add wave -noupdate -expand -group {fsm} /interfaceAES_tb/dut/fsmInterface_1/shift_in_key
add wave -noupdate -expand -group {fsm} /interfaceAES_tb/dut/fsmInterface_1/shift_out
add wave -noupdate -expand -group {fsm} /interfaceAES_tb/dut/fsmInterface_1/state
add wave -noupdate -expand -group {fsm} /interfaceAES_tb/dut/fsmInterface_1/next_state
add wave -noupdate -expand -group {fsm} /interfaceAES_tb/dut/fsmInterface_1/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {227346 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod -1294967296
configure wave -griddelta 20
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {512 ns}
