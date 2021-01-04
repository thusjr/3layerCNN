
`include "defines.v"

module main();


input                       clk;
input                       rst;
input                       startFlag;




//multi----------------------------
    reg signed [14:0] multi00;
    reg signed [14:0] multi01;
    reg signed [14:0] multi02;
    reg signed [14:0] multi03;
    reg signed [14:0] multi04;
    reg signed [14:0] multi10;
    reg signed [14:0] multi11;
    reg signed [14:0] multi12;
    reg signed [14:0] multi13;
    reg signed [14:0] multi14;
    reg signed [14:0] multi20;
    reg signed [14:0] multi21;
    reg signed [14:0] multi22;
    reg signed [14:0] multi23;
    reg signed [14:0] multi24;
    reg signed [14:0] multi30;
    reg signed [14:0] multi31;
    reg signed [14:0] multi32;
    reg signed [14:0] multi33;
    reg signed [14:0] multi34;
    reg signed [14:0] multi40;
    reg signed [14:0] multi41;
    reg signed [14:0] multi42;
    reg signed [14:0] multi43;
    reg signed [14:0] multi44;
//--


//Multiplier----------------------------
    reg signed [7:0] Multiplier00;
    reg signed [7:0] Multiplier01;
    reg signed [7:0] Multiplier02;
    reg signed [7:0] Multiplier03;
    reg signed [7:0] Multiplier04;
    reg signed [7:0] Multiplier10;
    reg signed [7:0] Multiplier11;
    reg signed [7:0] Multiplier12;
    reg signed [7:0] Multiplier13;
    reg signed [7:0] Multiplier14;
    reg signed [7:0] Multiplier20;
    reg signed [7:0] Multiplier21;
    reg signed [7:0] Multiplier22;
    reg signed [7:0] Multiplier23;
    reg signed [7:0] Multiplier24;
    reg signed [7:0] Multiplier30;
    reg signed [7:0] Multiplier31;
    reg signed [7:0] Multiplier32;
    reg signed [7:0] Multiplier33;
    reg signed [7:0] Multiplier34;
    reg signed [7:0] Multiplier40;
    reg signed [7:0] Multiplier41;
    reg signed [7:0] Multiplier42;
    reg signed [7:0] Multiplier43;
    reg signed [7:0] Multiplier44;
//--


//input photo 28*28----------------
    reg signed [7:0] ifmap [783:0];
    reg        [9:0] addrimp; //max=11_0000_1111=783
//--


//kernelNumber---------------------
    reg        [2:0] kernelNumber; 
//--
//plusi----------------------------
    reg signed [19:0] plusi00;
    reg signed [19:0] plusi01;
    reg signed [19:0] plusi02;
    reg signed [19:0] plusi03;
    reg signed [19:0] plusi04;
    reg signed [19:0] plusi10;
    reg signed [19:0] plusi11;
    reg signed [19:0] plusi12;
    reg signed [19:0] plusi13;
    reg signed [19:0] plusi14;
    reg signed [19:0] plusi20;
    reg signed [19:0] plusi21;
    reg signed [19:0] plusi22;
    reg signed [19:0] plusi23;
    reg signed [19:0] plusi24;
    reg signed [19:0] plusi30;
    reg signed [19:0] plusi31;
    reg signed [19:0] plusi32;
    reg signed [19:0] plusi33;
    reg signed [19:0] conv_o0;
    reg signed [19:0] conv_o1;
    reg signed [19:0] conv_o2;
    reg signed [19:0] conv_o3;
    reg signed [19:0] pool0;
    reg signed [19:0] pool1;
    reg signed [19:0] pool_o;
//--


//multi----------------------------
//--


//multi----------------------------
//--
//multi----------------------------
//--
//multi----------------------------
//--
reg   [StateLength]         State;
always @(posedge clk or negedge rst) begin
    if( rst == 0 ) begin
        State <= Idle;
        addrimp <= 0;
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
//          all---------------------------------
            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 27;

            addrimp <= addrimp + 1;
            addrimp <= addrimp + 27;
            addrimp <= addrimp + 1;
            addrimp <= addrimp - 23;
//          1-----------------------------------
            Multiplier00 <= ifmap[addrimp+0];
            Multiplier01 <= ifmap[addrimp+1];
            Multiplier02 <= ifmap[addrimp+2];
            Multiplier03 <= ifmap[addrimp+3];
            Multiplier04 <= ifmap[addrimp+4];
            Multiplier10 <= ifmap[addrimp+28];
            Multiplier11 <= ifmap[addrimp+29];
            Multiplier12 <= ifmap[addrimp+30];
            Multiplier13 <= ifmap[addrimp+31];
            Multiplier14 <= ifmap[addrimp+32];
            Multiplier20 <= ifmap[addrimp+56];
            Multiplier21 <= ifmap[addrimp+57];
            Multiplier22 <= ifmap[addrimp+58];
            Multiplier23 <= ifmap[addrimp+59];
            Multiplier24 <= ifmap[addrimp+60];
            Multiplier30 <= ifmap[addrimp+84];
            Multiplier31 <= ifmap[addrimp+85];
            Multiplier32 <= ifmap[addrimp+86];
            Multiplier33 <= ifmap[addrimp+87];
            Multiplier34 <= ifmap[addrimp+88];
            Multiplier40 <= ifmap[addrimp+112];
            Multiplier41 <= ifmap[addrimp+113];
            Multiplier42 <= ifmap[addrimp+114];
            Multiplier43 <= ifmap[addrimp+115];
            Multiplier44 <= ifmap[addrimp+116];
//          2-----------------------------------
            case(kernelNumber)
                0:begin
                    multi00 <= Multiplier00 * `kern0multi00;
                    multi01 <= Multiplier01 * `kern0multi01;
                    multi02 <= Multiplier02 * `kern0multi02;
                    multi03 <= Multiplier03 * `kern0multi03;
                    multi04 <= Multiplier04 * `kern0multi04;
                    multi10 <= Multiplier10 * `kern0multi10;
                    multi11 <= Multiplier11 * `kern0multi11;
                    multi12 <= Multiplier12 * `kern0multi12;
                    multi13 <= Multiplier13 * `kern0multi13;
                    multi14 <= Multiplier14 * `kern0multi14;
                    multi20 <= Multiplier20 * `kern0multi20;
                    multi21 <= Multiplier21 * `kern0multi21;
                    multi22 <= Multiplier22 * `kern0multi22;
                    multi23 <= Multiplier23 * `kern0multi23;
                    multi24 <= Multiplier24 * `kern0multi24;
                    multi30 <= Multiplier30 * `kern0multi30;
                    multi31 <= Multiplier31 * `kern0multi31;
                    multi32 <= Multiplier32 * `kern0multi32;
                    multi33 <= Multiplier33 * `kern0multi33;
                    multi34 <= Multiplier34 * `kern0multi34;
                    multi40 <= Multiplier40 * `kern0multi40;
                    multi41 <= Multiplier41 * `kern0multi41;
                    multi42 <= Multiplier42 * `kern0multi42;
                    multi43 <= Multiplier43 * `kern0multi43;
                    multi44 <= Multiplier44 * `kern0multi44;
                end
                1:begin
                    multi00 <= Multiplier00 * `kern1multi00;
                    multi01 <= Multiplier01 * `kern1multi01;
                    multi02 <= Multiplier02 * `kern1multi02;
                    multi03 <= Multiplier03 * `kern1multi03;
                    multi04 <= Multiplier04 * `kern1multi04;
                    multi10 <= Multiplier10 * `kern1multi10;
                    multi11 <= Multiplier11 * `kern1multi11;
                    multi12 <= Multiplier12 * `kern1multi12;
                    multi13 <= Multiplier13 * `kern1multi13;
                    multi14 <= Multiplier14 * `kern1multi14;
                    multi20 <= Multiplier20 * `kern1multi20;
                    multi21 <= Multiplier21 * `kern1multi21;
                    multi22 <= Multiplier22 * `kern1multi22;
                    multi23 <= Multiplier23 * `kern1multi23;
                    multi24 <= Multiplier24 * `kern1multi24;
                    multi30 <= Multiplier30 * `kern1multi30;
                    multi31 <= Multiplier31 * `kern1multi31;
                    multi32 <= Multiplier32 * `kern1multi32;
                    multi33 <= Multiplier33 * `kern1multi33;
                    multi34 <= Multiplier34 * `kern1multi34;
                    multi40 <= Multiplier40 * `kern1multi40;
                    multi41 <= Multiplier41 * `kern1multi41;
                    multi42 <= Multiplier42 * `kern1multi42;
                    multi43 <= Multiplier43 * `kern1multi43;
                    multi44 <= Multiplier44 * `kern1multi44;
                end
                2:begin
                    multi00 <= Multiplier00 * `kern2multi00;
                    multi01 <= Multiplier01 * `kern2multi01;
                    multi02 <= Multiplier02 * `kern2multi02;
                    multi03 <= Multiplier03 * `kern2multi03;
                    multi04 <= Multiplier04 * `kern2multi04;
                    multi10 <= Multiplier10 * `kern2multi10;
                    multi11 <= Multiplier11 * `kern2multi11;
                    multi12 <= Multiplier12 * `kern2multi12;
                    multi13 <= Multiplier13 * `kern2multi13;
                    multi14 <= Multiplier14 * `kern2multi14;
                    multi20 <= Multiplier20 * `kern2multi20;
                    multi21 <= Multiplier21 * `kern2multi21;
                    multi22 <= Multiplier22 * `kern2multi22;
                    multi23 <= Multiplier23 * `kern2multi23;
                    multi24 <= Multiplier24 * `kern2multi24;
                    multi30 <= Multiplier30 * `kern2multi30;
                    multi31 <= Multiplier31 * `kern2multi31;
                    multi32 <= Multiplier32 * `kern2multi32;
                    multi33 <= Multiplier33 * `kern2multi33;
                    multi34 <= Multiplier34 * `kern2multi34;
                    multi40 <= Multiplier40 * `kern2multi40;
                    multi41 <= Multiplier41 * `kern2multi41;
                    multi42 <= Multiplier42 * `kern2multi42;
                    multi43 <= Multiplier43 * `kern2multi43;
                    multi44 <= Multiplier44 * `kern2multi44;
                end
                3:begin
                    multi00 <= Multiplier00 * `kern3multi00;
                    multi01 <= Multiplier01 * `kern3multi01;
                    multi02 <= Multiplier02 * `kern3multi02;
                    multi03 <= Multiplier03 * `kern3multi03;
                    multi04 <= Multiplier04 * `kern3multi04;
                    multi10 <= Multiplier10 * `kern3multi10;
                    multi11 <= Multiplier11 * `kern3multi11;
                    multi12 <= Multiplier12 * `kern3multi12;
                    multi13 <= Multiplier13 * `kern3multi13;
                    multi14 <= Multiplier14 * `kern3multi14;
                    multi20 <= Multiplier20 * `kern3multi20;
                    multi21 <= Multiplier21 * `kern3multi21;
                    multi22 <= Multiplier22 * `kern3multi22;
                    multi23 <= Multiplier23 * `kern3multi23;
                    multi24 <= Multiplier24 * `kern3multi24;
                    multi30 <= Multiplier30 * `kern3multi30;
                    multi31 <= Multiplier31 * `kern3multi31;
                    multi32 <= Multiplier32 * `kern3multi32;
                    multi33 <= Multiplier33 * `kern3multi33;
                    multi34 <= Multiplier34 * `kern3multi34;
                    multi40 <= Multiplier40 * `kern3multi40;
                    multi41 <= Multiplier41 * `kern3multi41;
                    multi42 <= Multiplier42 * `kern3multi42;
                    multi43 <= Multiplier43 * `kern3multi43;
                    multi44 <= Multiplier44 * `kern3multi44;
                end
                4:begin
                    multi00 <= Multiplier00 * `kern4multi00;
                    multi01 <= Multiplier01 * `kern4multi01;
                    multi02 <= Multiplier02 * `kern4multi02;
                    multi03 <= Multiplier03 * `kern4multi03;
                    multi04 <= Multiplier04 * `kern4multi04;
                    multi10 <= Multiplier10 * `kern4multi10;
                    multi11 <= Multiplier11 * `kern4multi11;
                    multi12 <= Multiplier12 * `kern4multi12;
                    multi13 <= Multiplier13 * `kern4multi13;
                    multi14 <= Multiplier14 * `kern4multi14;
                    multi20 <= Multiplier20 * `kern4multi20;
                    multi21 <= Multiplier21 * `kern4multi21;
                    multi22 <= Multiplier22 * `kern4multi22;
                    multi23 <= Multiplier23 * `kern4multi23;
                    multi24 <= Multiplier24 * `kern4multi24;
                    multi30 <= Multiplier30 * `kern4multi30;
                    multi31 <= Multiplier31 * `kern4multi31;
                    multi32 <= Multiplier32 * `kern4multi32;
                    multi33 <= Multiplier33 * `kern4multi33;
                    multi34 <= Multiplier34 * `kern4multi34;
                    multi40 <= Multiplier40 * `kern4multi40;
                    multi41 <= Multiplier41 * `kern4multi41;
                    multi42 <= Multiplier42 * `kern4multi42;
                    multi43 <= Multiplier43 * `kern4multi43;
                    multi44 <= Multiplier44 * `kern4multi44;
                end
//          3-----------------------------------
            plusi00 <= multi00 + multi44;
            plusi01 <= multi01 + multi43;
            plusi02 <= multi02 + multi42;
            plusi03 <= multi03 + multi41;
            plusi04 <= multi04 + multi40;
            plusi10 <= multi10 + multi34;
            plusi11 <= multi11 + multi33;
            plusi12 <= multi12 + multi32;
            plusi13 <= multi13 + multi31;
            plusi14 <= multi14 + multi30;
            plusi20 <= multi20 + multi24;
            plusi21 <= multi21 + multi23;
//          4-----------------------------------
            plusi22 <= plusi00 + plusi01 + plusi02;
            plusi23 <= plusi03 + plusi04 + plusi10;
            plusi24 <= plusi11 + plusi12 + plusi13;
            plusi31 <= plusi14 + plusi20 + plusi21;
//          5-----------------------------------
            plusi32 <= plusi22 + plusi23 + multi22;
            plusi33 <= plusi24 + plusi31;
//          6 7 8 9-----------------------------
            case(kernelNumber) 
                0:conv_o0 <= plusi32 + plusi33 + kern0bias;
                1:conv_o0 <= plusi32 + plusi33 + kern1bias;
                2:conv_o0 <= plusi32 + plusi33 + kern2bias;
                3:conv_o0 <= plusi32 + plusi33 + kern3bias;
                4:conv_o0 <= plusi32 + plusi33 + kern4bias;
            endcase 
            conv_o1 <= conv_o0;
            conv_o2 <= conv_o1;
            conv_o3 <= conv_o2;
//          10----------------------------------
            if(startpool) begin
                if($signed(conv_o0) >= $signed(conv_o1)) begin
                    pool0 <= conv_o0;
                end else begin
                    pool0 <= conv_o1;
                end

                if($signed(conv_o2) >= $signed(conv_o3)) begin
                    pool1 <= conv_o2;
                end else begin
                    pool1 <= conv_o3;
                end                
            end
//          11----------------------------------
            if($signed(pool0) >= $signed(pool1)) begin
                pool_o <= pool0;
            end else begin
                pool_o <= pool1;
            end
//          12 quantic--------------------------
            if(registers46 > $signed(28'b0000_0000_0000_0111_1111_1111_1111))begin
                out4 <= `PosiFull;
            end else if(registers46 < $signed(28'b1111_1111_1111_1000_0000_0000_0000))begin
                out4 <= `NegFull;
            end else if (registers46 >= 0 || (registers46 < 0 && registers46[7:0]==0)) begin
                out4 <= registers46>>>8;
            end else if(registers46 < 0 && registers46[7:0]!=0)begin
                // out4 <= (registers46>>>8) - 1;
                out4 <= (registers46>>>8);
            end            
//          13----------------------------------
//          14----------------------------------
//          15----------------------------------
//          16----------------------------------

            
            endcase
            end
        endcase
    end


end



endmodule