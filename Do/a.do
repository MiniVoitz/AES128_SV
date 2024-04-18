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
add wave -noupdate -group Bufferkey -radix hexadecimal /AES128_tb/dut/B0/buff_out
add wave -noupdate -group Bufferkey -radix hexadecimal /AES128_tb/dut/B1/buff_out
add wave -noupdate -group Bufferkey -radix hexadecimal /AES128_tb/dut/B2/buff_out
add wave -noupdate -group Bufferkey -radix hexadecimal /AES128_tb/dut/B3/buff_out
add wave -noupdate -group Bufferkey -radix hexadecimal /AES128_tb/dut/B4/buff_out
add wave -noupdate -group Bufferkey -radix hexadecimal /AES128_tb/dut/B5/buff_out
add wave -noupdate -group Bufferkey -radix hexadecimal /AES128_tb/dut/B6/buff_out
add wave -noupdate -group Bufferkey -radix hexadecimal /AES128_tb/dut/B7/buff_out
add wave -noupdate -group Bufferkey -radix hexadecimal /AES128_tb/dut/B8/buff_out
add wave -noupdate -group Bufferkey -radix hexadecimal /AES128_tb/dut/B9/buff_out
add wave -noupdate -group Bufferkey -radix hexadecimal /AES128_tb/dut/B10/buff_out
add wave -noupdate -group FirstBuff -radix hexadecimal /AES128_tb/dut/buffer1/buff_out
add wave -noupdate -group FirstBuff -radix hexadecimal /AES128_tb/dut/buffer2/buff_out
add wave -noupdate /AES128_tb/dut/keyChange
add wave -noupdate -expand -group {sel} /AES128_tb/dut/fsm1/sel1
add wave -noupdate -expand -group {sel} /AES128_tb/dut/fsm1/sel2
add wave -noupdate -expand -group {sel} /AES128_tb/dut/fsm1/sel3
add wave -noupdate -expand -group {sel} /AES128_tb/dut/fsm1/sel4
add wave -noupdate -expand -group {sel} /AES128_tb/dut/fsm1/sel5
add wave -noupdate -expand -group {buffer} /AES128_tb/dut/fsm1/buffer1en
add wave -noupdate -expand -group {buffer} /AES128_tb/dut/fsm1/buffer2en
add wave -noupdate -expand -group {buffer} /AES128_tb/dut/fsm1/buffer3en
add wave -noupdate -expand -group {buffer} /AES128_tb/dut/fsm1/buffer4en
add wave -noupdate -expand -group {buffer} /AES128_tb/dut/fsm1/buffer5en
add wave -noupdate -expand -group {buffer} /AES128_tb/dut/fsm1/buffer7en
add wave -noupdate -expand -group {buffer} /AES128_tb/dut/fsm1/buffer8en
add wave -noupdate -expand -group {buffer} /AES128_tb/dut/fsm1/buffer9en
add wave -noupdate -group {bufferKey} /AES128_tb/dut/fsm1/B0en
add wave -noupdate -group {bufferKey} /AES128_tb/dut/fsm1/B1en
add wave -noupdate -group {bufferKey} /AES128_tb/dut/fsm1/B2en
add wave -noupdate -group {bufferKey} /AES128_tb/dut/fsm1/B3en
add wave -noupdate -group {bufferKey} /AES128_tb/dut/fsm1/B4en
add wave -noupdate -group {bufferKey} /AES128_tb/dut/fsm1/B5en
add wave -noupdate -group {bufferKey} /AES128_tb/dut/fsm1/B6en
add wave -noupdate -group {bufferKey} /AES128_tb/dut/fsm1/B7en
add wave -noupdate -group {bufferKey} /AES128_tb/dut/fsm1/B8en
add wave -noupdate -group {bufferKey} /AES128_tb/dut/fsm1/B9en
add wave -noupdate -group {bufferKey} /AES128_tb/dut/fsm1/B10en
add wave -noupdate /AES128_tb/dut/fsm1/i
add wave -noupdate /AES128_tb/dut/fsm1/keyInit
add wave -noupdate -expand -group {bufferout} -radix hexadecimal /AES128_tb/dut/buffer3/buff_out
add wave -noupdate -expand -group {bufferout} -radix hexadecimal /AES128_tb/dut/buffer4/buff_out
add wave -noupdate -expand -group {bufferout} -radix hexadecimal /AES128_tb/dut/buffer5/buff_out
add wave -noupdate -expand -group {bufferout} -radix hexadecimal /AES128_tb/dut/buffer1/buff_out
add wave -noupdate -expand -group {bufferout} -radix hexadecimal /AES128_tb/dut/buffer2/buff_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {282 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 251
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
WaveRestoreZoom {20 ps} {610 ps}
