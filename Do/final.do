onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Clock -radix hexadecimal /PuceAES128_tb/clk
add wave -noupdate -expand -group Clock -radix hexadecimal /PuceAES128_tb/reset
add wave -noupdate -radix hexadecimal /PuceAES128_tb/selCypher
add wave -noupdate -radix hexadecimal /PuceAES128_tb/start
add wave -noupdate -radix hexadecimal /PuceAES128_tb/RW
add wave -noupdate -radix hexadecimal /PuceAES128_tb/adress
add wave -noupdate -radix hexadecimal /PuceAES128_tb/initiate
add wave -noupdate -expand -group Bus -radix hexadecimal /PuceAES128_tb/data
add wave -noupdate -expand -group Bus -radix hexadecimal /PuceAES128_tb/data_in
add wave -noupdate -expand -group Bus -radix hexadecimal /PuceAES128_tb/data_out
add wave -noupdate -expand -group {Bloc AES} -radix hexadecimal /PuceAES128_tb/dut/AES128_1/message_in
add wave -noupdate -expand -group {Bloc AES} -radix hexadecimal /PuceAES128_tb/dut/AES128_1/key
add wave -noupdate -expand -group {Bloc AES} -radix hexadecimal /PuceAES128_tb/dut/AES128_1/message_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {191448 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 196
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {995028 ps}
