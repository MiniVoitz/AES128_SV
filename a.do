onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /AES128_tb/clk
add wave -noupdate /AES128_tb/reset
add wave -noupdate -expand -group AES128 -radix hexadecimal /AES128_tb/message_in
add wave -noupdate -expand -group AES128 -radix hexadecimal /AES128_tb/key
add wave -noupdate -expand -group AES128 -radix hexadecimal /AES128_tb/message_out
add wave -noupdate /AES128_tb/selCypher
add wave -noupdate -expand -group fsm /AES128_tb/dut/fsm1/state
add wave -noupdate -expand -group fsm /AES128_tb/dut/fsm1/next_state
add wave -noupdate -expand -group Bufferkey -radix hexadecimal /AES128_tb/dut/B0/buff_out
add wave -noupdate -expand -group Bufferkey -radix hexadecimal /AES128_tb/dut/B1/buff_out
add wave -noupdate -expand -group Bufferkey -radix hexadecimal /AES128_tb/dut/B2/buff_out
add wave -noupdate -expand -group Bufferkey -radix hexadecimal /AES128_tb/dut/B3/buff_out
add wave -noupdate -expand -group Bufferkey -radix hexadecimal /AES128_tb/dut/B4/buff_out
add wave -noupdate -expand -group Bufferkey -radix hexadecimal /AES128_tb/dut/B5/buff_out
add wave -noupdate -expand -group Bufferkey -radix hexadecimal /AES128_tb/dut/B6/buff_out
add wave -noupdate -expand -group Bufferkey -radix hexadecimal /AES128_tb/dut/B7/buff_out
add wave -noupdate -expand -group Bufferkey -radix hexadecimal /AES128_tb/dut/B8/buff_out
add wave -noupdate -expand -group Bufferkey -radix hexadecimal /AES128_tb/dut/B9/buff_out
add wave -noupdate -expand -group Bufferkey -radix hexadecimal /AES128_tb/dut/B10/buff_out
add wave -noupdate -expand -group FirstBuff -radix hexadecimal /AES128_tb/dut/buffer1/buff_out
add wave -noupdate -expand -group FirstBuff -radix hexadecimal /AES128_tb/dut/buffer2/buff_out
add wave -noupdate /AES128_tb/dut/keyChange
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {36 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {252 ps}
