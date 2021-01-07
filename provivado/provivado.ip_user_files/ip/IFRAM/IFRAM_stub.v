// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu Jan  7 19:24:38 2021
// Host        : LAPTOP-PD9C7IFG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/GradeFour/FPGA-1/project/3layerCNN/provivado/provivado.srcs/sources_1/ip/IFRAM/IFRAM_stub.v
// Design      : IFRAM
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1157-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2019.2" *)
module IFRAM(clka, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[6:0],dina[63:0],douta[63:0]" */;
  input clka;
  input [0:0]wea;
  input [6:0]addra;
  input [63:0]dina;
  output [63:0]douta;
endmodule
