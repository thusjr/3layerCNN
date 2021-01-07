onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib IFRAM_opt

do {wave.do}

view wave
view structure
view signals

do {IFRAM.udo}

run -all

quit -force
