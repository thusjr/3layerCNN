module testbench();

//100Mhz 0.000000010000 5000
// ms um ps ns


wire done;
reg clk;
reg rst;
reg startflag;
main mymain(
    .clk(clk),
    .rst(rst),
    .startFlag(startflag),
    .done(done)
);

initial begin
    clk =1;
    rst = 0;
    #100000
    rst = 1;
end
always #5000 clk <= ~clk;


endmodule







