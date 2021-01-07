onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib FCROM_opt

do {wave.do}

view wave
view structure
view signals

do {FCROM.udo}

run -all

quit -force
