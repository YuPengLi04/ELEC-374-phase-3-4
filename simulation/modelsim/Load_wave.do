onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Load_tb/Zout
add wave -noupdate /Load_tb/Rout
add wave -noupdate /Load_tb/HIout
add wave -noupdate /Load_tb/LOout
add wave -noupdate /Load_tb/Zhighout
add wave -noupdate /Load_tb/Zlowout
add wave -noupdate /Load_tb/PCout
add wave -noupdate /Load_tb/MDRout
add wave -noupdate /Load_tb/InPortout
add wave -noupdate /Load_tb/Cout
add wave -noupdate /Load_tb/MARin
add wave -noupdate /Load_tb/Zin
add wave -noupdate /Load_tb/PCin
add wave -noupdate /Load_tb/MDRin
add wave -noupdate /Load_tb/IRin
add wave -noupdate /Load_tb/Yin
add wave -noupdate /Load_tb/Gra
add wave -noupdate /Load_tb/Grb
add wave -noupdate /Load_tb/Grc
add wave -noupdate /Load_tb/Rin
add wave -noupdate /Load_tb/Read
add wave -noupdate /Load_tb/IncPC
add wave -noupdate /Load_tb/HIin
add wave -noupdate /Load_tb/LOin
add wave -noupdate /Load_tb/ZhighIn
add wave -noupdate /Load_tb/ZlowIn
add wave -noupdate /Load_tb/BAout
add wave -noupdate /Load_tb/IRout
add wave -noupdate /Load_tb/clock
add wave -noupdate /Load_tb/clear
add wave -noupdate /Load_tb/Present_state
add wave -noupdate /Load_tb/MAR_value
add wave -noupdate /Load_tb/IR_value
add wave -noupdate /Load_tb/PC_value
add wave -noupdate /Load_tb/MDR_value
add wave -noupdate /Load_tb/R1_value
add wave -noupdate /Load_tb/R0_value
add wave -noupdate /Load_tb/BusMuxOut_value
add wave -noupdate /Load_tb/RAMdataOut_value
add wave -noupdate /Load_tb/R0out
add wave -noupdate -radix hexadecimal /Load_tb/DUT/clock
add wave -noupdate -radix hexadecimal /Load_tb/DUT/MDR1/BusMuxOut
add wave -noupdate -radix hexadecimal /Load_tb/DUT/MDR1/Mdatain
add wave -noupdate -radix hexadecimal /Load_tb/DUT/MDR1/BusMuxInMDR
add wave -noupdate -radix hexadecimal /Load_tb/DUT/BusMuxInMDR
add wave -noupdate -radix hexadecimal /Load_tb/DUT/IR/enable
add wave -noupdate /Load_tb/IRin
add wave -noupdate -radix hexadecimal /Load_tb/DUT/IR/BusMuxOut
add wave -noupdate -radix hexadecimal /Load_tb/DUT/IR/BusMuxIn
add wave -noupdate -radix hexadecimal /Load_tb/DUT/IR/q
add wave -noupdate /Load_tb/DUT/BusMuxOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {86406 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 225
configure wave -valuecolwidth 104
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {224416 ps}
