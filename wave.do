onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group fsm -radix hexadecimal /AEScipher128_tb/dut/fsm1/state
add wave -noupdate -expand -group fsm /AEScipher128_tb/dut/fsm1/keyInit
add wave -noupdate -expand -group fsm /AEScipher128_tb/dut/fsm1/i
add wave -noupdate -expand -group Buffer -radix hexadecimal /AEScipher128_tb/dut/buffer2/buff_out
add wave -noupdate -expand -group Buffer -radix hexadecimal /AEScipher128_tb/dut/buffer1/buff_out
add wave -noupdate -expand -group Buffer -radix hexadecimal /AEScipher128_tb/dut/buffer3/buff_out
add wave -noupdate -expand -group Buffer -radix hexadecimal /AEScipher128_tb/dut/buffer4/buff_out
add wave -noupdate -expand -group Buffer -radix hexadecimal /AEScipher128_tb/dut/buffer5/buff_out
add wave -noupdate -expand -group Buffer -radix hexadecimal /AEScipher128_tb/dut/buffer6/buff_out
add wave -noupdate -expand -group Buffer /AEScipher128_tb/dut/buffer6/buff_en
add wave -noupdate -expand -group Buffer -radix hexadecimal /AEScipher128_tb/dut/buffer6/buff_in
add wave -noupdate -expand -group {Multiplexer
} -radix hexadecimal /AEScipher128_tb/dut/mult2/sel
add wave -noupdate -expand -group {Multiplexer
} -radix hexadecimal /AEScipher128_tb/dut/mult2/out
add wave -noupdate -expand -group {Multiplexer
} -radix hexadecimal /AEScipher128_tb/dut/mult2/a
add wave -noupdate -expand -group {Multiplexer
} -radix hexadecimal /AEScipher128_tb/dut/mult2/b
add wave -noupdate -expand -group {Multiplexer
} /AEScipher128_tb/dut/mult/a
add wave -noupdate -expand -group {Multiplexer
} /AEScipher128_tb/dut/mult/b
add wave -noupdate -expand -group {keyexpansion
} -radix hexadecimal /AEScipher128_tb/dut/keyexpansion1/roundKey
add wave -noupdate -expand -group {keyexpansion
} -radix hexadecimal /AEScipher128_tb/dut/keyexpansion1/key
add wave -noupdate -expand -group {keyexpansion
} -radix hexadecimal /AEScipher128_tb/dut/keyexpansion1/roundKey
add wave -noupdate -radix hexadecimal /AEScipher128_tb/clk
add wave -noupdate -radix hexadecimal /AEScipher128_tb/reset
add wave -noupdate -radix hexadecimal /AEScipher128_tb/message
add wave -noupdate -radix hexadecimal /AEScipher128_tb/key
add wave -noupdate -radix hexadecimal /AEScipher128_tb/crypte
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {397 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 286
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
WaveRestoreZoom {0 ps} {560 ps}
