
`include "defines.v"

module main(clk,rst,startFlag,done);


input                       clk;
input                       rst;
input                       startFlag;
output reg                  done;
/*************
输入 9bit 8bit
乘法 8+7+1 = 16bit
*************/

reg [2:0] finalstate;


//multi----------------------------
    reg signed [15:0] multi00; 
    reg signed [15:0] multi01;
    reg signed [15:0] multi02;
    reg signed [15:0] multi03;
    reg signed [15:0] multi04;
    reg signed [15:0] multi10;
    reg signed [15:0] multi11;
    reg signed [15:0] multi12;
    reg signed [15:0] multi13;
    reg signed [15:0] multi14;
    reg signed [15:0] multi20;
    reg signed [15:0] multi21;
    reg signed [15:0] multi22;
    reg signed [15:0] multi23;
    reg signed [15:0] multi24;
    reg signed [15:0] multi30;
    reg signed [15:0] multi31;
    reg signed [15:0] multi32;
    reg signed [15:0] multi33;
    reg signed [15:0] multi34;
    reg signed [15:0] multi40;
    reg signed [15:0] multi41;
    reg signed [15:0] multi42;
    reg signed [15:0] multi43;
    reg signed [15:0] multi44;
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
    reg        [1:0] fourswitch;
//--

//kernelNumber---------------------
    reg        [2:0] kernelNumber; 
    reg        [2:0] kernelNumber1; 
    reg        [2:0] kernelNumber2; 
    reg        [2:0] kernelNumber3; 
    reg        [2:0] kernelNumber4; 
    reg        [2:0] kernelNumber5; 
//--
//plusi----------------------------
    reg signed [20:0] plusi00;
    reg signed [20:0] plusi01;
    reg signed [20:0] plusi02;
    reg signed [20:0] plusi03;
    reg signed [20:0] plusi04;
    reg signed [20:0] plusi10;
    reg signed [20:0] plusi11;
    reg signed [20:0] plusi12;
    reg signed [20:0] plusi13;
    reg signed [20:0] plusi14;
    reg signed [20:0] plusi20;
    reg signed [20:0] plusi21;
    reg signed [20:0] plusi22;
    reg signed [20:0] plusi23;
    reg signed [20:0] plusi24;
    // reg signed [20:0] plusi30;
    reg signed [20:0] plusi31;
    reg signed [20:0] plusi32;
    reg signed [20:0] plusi33;
    reg signed [20:0] conv_o0;
    reg signed [20:0] conv_o1;
    reg signed [20:0] conv_o2;
    reg signed [20:0] conv_o3;
    reg signed [20:0] pool0;
    reg signed [20:0] pool1;
    reg signed [20:0] pool_o;
//--

//quantic----------------------------
    reg signed [7:0] quantic;
//--

//FCout----------------------------
    reg signed [14:0] FCout0;
    reg signed [14:0] FCout1;
    reg signed [14:0] FCout2;
    reg signed [14:0] FCout3;
    reg signed [14:0] FCout4;
    reg signed [14:0] FCout5;
    reg signed [14:0] FCout6;
    reg signed [14:0] FCout7;
    reg signed [14:0] FCout8;
    reg signed [14:0] FCout9;
    reg signed [24:0] numout0;
    reg signed [24:0] numout1;
    reg signed [24:0] numout2;
    reg signed [24:0] numout3;
    reg signed [24:0] numout4;
    reg signed [24:0] numout5;
    reg signed [24:0] numout6;
    reg signed [24:0] numout7;
    reg signed [24:0] numout8;
    reg signed [24:0] numout9;
//--
//FCweight----------------------------
    reg signed [7:0] FCweight0;
    reg signed [7:0] FCweight1;
    reg signed [7:0] FCweight2;
    reg signed [7:0] FCweight3;
    reg signed [7:0] FCweight4;
    reg signed [7:0] FCweight5;
    reg signed [7:0] FCweight6;
    reg signed [7:0] FCweight7;
    reg signed [7:0] FCweight8;
    reg signed [7:0] FCweight9;
//--
//cmp------------------------------
    reg signed [24:0] cmp0;
    reg signed [24:0] cmp1;
    reg signed [24:0] cmp2;
    reg signed [24:0] cmp3;
    reg signed [24:0] cmp4;
    reg signed [24:0] cmp5;
    reg signed [24:0] cmp6;
    reg signed [24:0] cmp7;
    reg signed [24:0] cmp8;
    reg        [3: 0] res;
//--

//counter----------------------------
    reg        [10:0] counter;
    reg        [5:0] impcounter;
//--
//startpool----------------------------
    reg [1:0]  startpool ;
//--
//startfc----------------------------
    reg startfc1;
    reg startfc2;
    reg startfc3;
    reg startfc4;
//--

////ramrom QUARTUS VERSION----------------------------
//    reg  [9:0]   addr_FCROM;
//    wire [107:0]    q_FCROM;
//    FCROM MYFCROM(
//        .clock(clk),
//        .address(addr_FCROM),
//        .q(q_FCROM)
//    );

//    reg  [6:0]     addr_IFRAM;
//    wire [63:0]    q_IFRAM;
//    reg  [63:0]    data_IFRAM;
//    reg            wren_IFRAM;

//    IFRAM MYIFRAM(
//        .clock(clk),
//        .data(data_IFRAM),
//        .address(addr_IFRAM),
//        .q(q_IFRAM),
//        .wren(wren_IFRAM)
//    );
////--
//ramrom VIVADO VERSION----------------------------
    reg  [9:0]   addr_FCROM;
    wire [127:0]    q_FCROM;
    FCROM MYFCROM(
        .clka(clk),
        .addra(addr_FCROM),
        .douta(q_FCROM)
    );

    reg  [6:0]     addr_IFRAM;
    wire [63:0]    q_IFRAM;
    reg  [63:0]    data_IFRAM;
    reg            wren_IFRAM;

    IFRAM MYIFRAM(
        .clka(clk),
        .dina(data_IFRAM),
        .addra(addr_IFRAM),
        .douta(q_IFRAM),
        .wea(wren_IFRAM)
    );
//--

//PE
reg   [`StateLength]         State;
always @(posedge clk or negedge rst) begin
    if( rst == 0 ) begin
        State <= `Idle;
    end else begin
        case(State) 
            `Idle: begin
                fourswitch <= 0;
                quantic <= 0;
                pool_o<=0;
                pool1<=0;
                pool0<=0;
                conv_o0<=0;
                conv_o1<=0;
                conv_o2<=0;
                conv_o3<=0;
                FCout0 <= 0;
                FCweight0 <= 0;
                FCout1 <= 0;
                FCweight1 <= 0;
                FCout2 <= 0;
                FCweight2 <= 0;
                FCout3 <= 0;
                FCweight3 <= 0;
                FCout4 <= 0;
                FCweight4 <= 0;
                FCout5 <= 0;
                FCweight5 <= 0;
                FCout6 <= 0;
                FCweight6 <= 0;
                FCout7 <= 0;
                FCweight7 <= 0;
                FCout8 <= 0;
                FCweight8 <= 0;
                FCout9 <= 0;
                FCweight9 <= 0;
                plusi00 <= 0;
                plusi01 <= 0;
                plusi02 <= 0;
                plusi03 <= 0;
                plusi04 <= 0;
                plusi10 <= 0;
                plusi11 <= 0;
                plusi12 <= 0;
                plusi13 <= 0;
                plusi14 <= 0;
                plusi20 <= 0;
                plusi21 <= 0;
                plusi22 <= 0;
                plusi23 <= 0;
                plusi24 <= 0;
                // plusi30 <= 0;
                plusi31 <= 0;
                plusi32 <= 0;
                plusi33 <= 0;
                // plusi34 <= 0;
                multi00 <= 0;
                multi01 <= 0;
                multi02 <= 0;
                multi03 <= 0;
                multi04 <= 0;
                multi10 <= 0;
                multi11 <= 0;
                multi12 <= 0;
                multi13 <= 0;
                multi14 <= 0;
                multi20 <= 0;
                multi21 <= 0;
                multi22 <= 0;
                multi23 <= 0;
                multi24 <= 0;
                multi30 <= 0;
                multi31 <= 0;
                multi32 <= 0;
                multi33 <= 0;
                multi34 <= 0;
                multi40 <= 0;
                multi41 <= 0;
                multi42 <= 0;
                multi43 <= 0;
                multi44 <= 0;
                Multiplier00 <= 0;
                Multiplier01 <= 0;
                Multiplier02 <= 0;
                Multiplier03 <= 0;
                Multiplier04 <= 0;
                Multiplier10 <= 0;
                Multiplier11 <= 0;
                Multiplier12 <= 0;
                Multiplier13 <= 0;
                Multiplier14 <= 0;
                Multiplier20 <= 0;
                Multiplier21 <= 0;
                Multiplier22 <= 0;
                Multiplier23 <= 0;
                Multiplier24 <= 0;
                Multiplier30 <= 0;
                Multiplier31 <= 0;
                Multiplier32 <= 0;
                Multiplier33 <= 0;
                Multiplier34 <= 0;
                Multiplier40 <= 0;
                Multiplier41 <= 0;
                Multiplier42 <= 0;
                Multiplier43 <= 0;
                Multiplier44 <= 0;
                numout0 <= 0;
                numout1 <= 0;
                numout2 <= 0;
                numout3 <= 0;
                numout4 <= 0;
                numout5 <= 0;
                numout6 <= 0;
                numout7 <= 0;
                numout8 <= 0;
                numout9 <= 0;
                addrimp <= 0;
                finalstate <= 0;
                done <= 0;
                addr_IFRAM <= 0;
                kernelNumber <= 1;
                counter <= 0;
                impcounter <= 0;
                kernelNumber1 <= 1;
                kernelNumber2 <= 1;
                kernelNumber3 <= 1;
                kernelNumber4 <= 1;
                kernelNumber5 <= 1;
                res <= 4'bzzzz;
                addr_FCROM <= 0;
                if(startFlag) begin
                    addr_IFRAM <= addr_IFRAM + 1;
                    State <= `Init;
                end
                startfc1 <= 0;
                startfc2 <= 0;
                startfc3 <= 0;
                startfc4 <= 0;
            end
            `Init: begin
                wren_IFRAM <= 0; //禁止其他地方写入数据
                if(addrimp == 777) begin
                    State <= `Calcu;
                    addrimp <= 0;
                end else begin
                    addrimp <= addrimp + 7;
                end
                addr_IFRAM <= addr_IFRAM + 1;
                ifmap [addrimp + 0] <= q_IFRAM[63:56];
                ifmap [addrimp + 1] <= q_IFRAM[55:48];
                ifmap [addrimp + 2] <= q_IFRAM[47:40];
                ifmap [addrimp + 3] <= q_IFRAM[39:32];
                ifmap [addrimp + 4] <= q_IFRAM[31:24];
                ifmap [addrimp + 5] <= q_IFRAM[23:16];
                ifmap [addrimp + 6] <= q_IFRAM[15:8];
            end
            `Calcu: begin
//          all---------------------------------
            counter  = counter + 1;
          
            if(impcounter == 47) begin
                impcounter <= 0;
                if(addrimp != 667) begin
                    addrimp <= addrimp + 5;
                end else begin
                    addrimp <= 0;
                    kernelNumber = kernelNumber + 1 ; 
                end
            end else begin
                case (fourswitch)
                    0:addrimp <= addrimp + 1;
                    1:addrimp <= addrimp + 27;
                    2:addrimp <= addrimp + 1;  
                    3:addrimp <= addrimp - 27;
                endcase
                impcounter <= impcounter + 1;
            end
            fourswitch <= fourswitch + 1;

//          1-----------------------------------
            kernelNumber1 <= kernelNumber; 
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
            kernelNumber2 <= kernelNumber1;
            case(kernelNumber1)
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
            endcase
//          3-----------------------------------
            kernelNumber3 <= kernelNumber2;
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
            kernelNumber4 <= kernelNumber3;
            plusi22 <= plusi00 + plusi01 + plusi02;
            plusi23 <= plusi03 + plusi04 + plusi10;
            plusi24 <= plusi11 + plusi12 + plusi13;
            plusi31 <= plusi14 + plusi20 + plusi21;
//          5-----------------------------------
            kernelNumber5 <= kernelNumber4;

            plusi32 <= plusi22 + plusi23 + multi22;
            plusi33 <= plusi24 + plusi31;
//          6 7 8 9-----------------------------
            case(kernelNumber5) 
                0:conv_o0 <= plusi32 + plusi33 + $signed(`kern0bias);
                1:conv_o0 <= plusi32 + plusi33 + $signed(`kern1bias);
                2:conv_o0 <= plusi32 + plusi33 + $signed(`kern2bias);
                3:conv_o0 <= plusi32 + plusi33 + $signed(`kern3bias);
                4:conv_o0 <= plusi32 + plusi33 + $signed(`kern4bias);
            endcase 
            conv_o1 <= conv_o0;
            conv_o2 <= conv_o1;
            conv_o3 <= conv_o2;
            if(counter == 8) begin
                startpool <= 2'b11;
            end else if(counter > 8)begin
                startpool <= startpool + 1;
            end else begin
                startpool <= 0;                
            end
//          10----------------------------------
            if(startpool==2'b11) begin
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

                startfc1 <= 1; 
                addr_FCROM <= addr_FCROM + 1;  
                if(addr_FCROM == 720) begin //放过719   
                    State <= `Stop;
                end      
            end else begin
                startfc1 <= 0;
            end
//          11----------------------------------
            startfc2 <= startfc1;
            if(startfc1 == 1) begin
                if($signed(pool0) >= $signed(pool1)) begin
                    pool_o <= pool0;
                end else begin
                    pool_o <= pool1;
                end
            end 
//          12 quantic--------------------------
            /*************
             量化处理�???
            输入�???0~255�???9bit，weight�???5bit量化
            �???后得�???21bit
            要压缩到8bit
            1+6+1�??? 也就是说，右�???4�???
            �???�???01111111_1111
            �???�???10000000_0000
            *************/
            startfc3 <= startfc2;
            if(startfc2 == 1) begin
                if(pool_o > $signed(21'b0_0000000_0111_1111_11111))begin
                    quantic <= 8'b01111111;
                end else if(pool_o < 0)begin
                    quantic <= 0;
                end else begin
                    quantic <= pool_o>>>5;
                end 
                FCweight0 <= q_FCROM[127:120];
                FCweight1 <= q_FCROM[119:112];
                FCweight2 <= q_FCROM[111:104];
                FCweight3 <= q_FCROM[103:96];
                FCweight4 <= q_FCROM[95:88];
                FCweight5 <= q_FCROM[87:80];
                FCweight6 <= q_FCROM[79:72];
                FCweight7 <= q_FCROM[71:64];
                FCweight8 <= q_FCROM[63:56];
                FCweight9 <= q_FCROM[55:48];
            end 
//          13----------------------------------
            //FC �???要载入数�???
            /*************
            数据规模
            8*8 = 15 输入
            输出�???�???720个数字相加（numberout1~10�???
            2 4 8 16 32 64 128 256 512 1024
            1 2 3 4 5   6  7   8   9   10
            扩大十位就可以了
            25bit
            *************/
            startfc4 <= startfc3;
            if(startfc3 == 1) begin
                FCout0 <= quantic * FCweight0;
                FCout1 <= quantic * FCweight1;
                FCout2 <= quantic * FCweight2;
                FCout3 <= quantic * FCweight3;
                FCout4 <= quantic * FCweight4;
                FCout5 <= quantic * FCweight5;
                FCout6 <= quantic * FCweight6;
                FCout7 <= quantic * FCweight7;
                FCout8 <= quantic * FCweight8;
                FCout9 <= quantic * FCweight9; 
            end           
//          14----------------------------------
            if(startfc4 == 1) begin
                numout0 <= numout0 + FCout0;
                numout1 <= numout1 + FCout1;
                numout2 <= numout2 + FCout2;
                numout3 <= numout3 + FCout3;
                numout4 <= numout4 + FCout4;
                numout5 <= numout5 + FCout5;
                numout6 <= numout6 + FCout6;
                numout7 <= numout7 + FCout7;
                numout8 <= numout8 + FCout8;
                numout9 <= numout9 + FCout9;
            end
//          15----------------------------------
            end
        `Stop: begin
//          1----------------------------------
            case (finalstate)
            0:begin
                finalstate <= 1;
                numout0 <= numout0 + $signed(`densebias0);
                numout1 <= numout1 + $signed(`densebias1);
                numout2 <= numout2 + $signed(`densebias2);
                numout3 <= numout3 + $signed(`densebias3);
                numout4 <= numout4 + $signed(`densebias4);
                numout5 <= numout5 + $signed(`densebias5);
                numout6 <= numout6 + $signed(`densebias6);
                numout7 <= numout7 + $signed(`densebias7);
                numout8 <= numout8 + $signed(`densebias8);
                numout9 <= numout9 + $signed(`densebias9);      
                end
            1:begin
                if($signed(numout0) >= $signed(numout9)) begin
                    cmp0 <= numout0;
                end else begin
                    cmp0 <= numout9;
                end
                if($signed(numout1) >= $signed(numout8)) begin
                    cmp1 <= numout1;
                end else begin
                    cmp1 <= numout8;
                end
                if($signed(numout2) >= $signed(numout7)) begin
                    cmp2 <= numout2;
                end else begin
                    cmp2 <= numout7;
                end
                if($signed(numout3) >= $signed(numout6)) begin
                    cmp3 <= numout3;
                end else begin
                    cmp3 <= numout6;
                end
                if($signed(numout4) >= $signed(numout5)) begin
                    cmp4 <= numout4;
                end else begin
                    cmp4 <= numout5;
                end
                finalstate <= 2;
            end
    //          2----------------------------------
            2:begin
                finalstate <= 3;
                if($signed(cmp0) >= $signed(cmp4)) begin
                    cmp5 <= cmp0;
                end else begin
                    cmp5 <= cmp4;
                end
                if($signed(cmp1) >= $signed(cmp3)) begin
                    cmp6 <= cmp1;
                end else begin
                    cmp6 <= cmp3;
                end
            end
    //          3----------------------------------
            3: begin
                finalstate <= 4;
                if($signed(cmp5) >= $signed(cmp6)) begin
                    cmp7 <= cmp5;
                end else begin
                    cmp7 <= cmp6;
                end
            end
    //          4----------------------------------
            4:begin
                finalstate <= 5;
                if($signed(cmp7) >= $signed(cmp2)) begin
                    cmp8 <= cmp7;
                end else begin
                    cmp8 <= cmp2;
                end
            end
    //          5----------------------------------
            5: begin
                finalstate <= 0;
                State <= `Idle;
                done <= 1;
                if(cmp8 == numout0)begin
                    // res <= 0;                    
                    res <= 7;                    
                end
                else if(cmp8 == numout1)begin
                    // res <= 1;
                end
                else if(cmp8 == numout2)begin
                    // res <= 2;
                end
                else if(cmp8 == numout3)begin
                    // res <= 3;
                end
                else if(cmp8 == numout4)begin
                    // res <= 4;
                end
                else if(cmp8 == numout5)begin
                    // res <= 5;
                end
                else if(cmp8 == numout6)begin
                    // res <= 6;
                end
                else if(cmp8 == numout7)begin
                    // res <= 7;
                end
                else if(cmp8 == numout8)begin
                    // res <= 8;
                end
                else if(cmp8 == numout9)begin
                    // res <= 9;
                end
                end
        endcase
        end
        endcase
    end
end
endmodule