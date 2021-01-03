
`include "defines.v"

module main();


input                       clk;
input                       rst;
input                       startFlag;

reg   [StateLength]         State;
always @(posedge clk or negedge rst) begin
    if( rst == 0 ) begin
        State <= Idle;
    end else begin
        case(State) 
            `Idle: begin
                if(startFlag) begin
                    State <= `Init;
                end
            end
            `Init: begin
                
                State <= `Calcu;
            end
            `Calcu: begin
                
            end

    end


end



endmodule