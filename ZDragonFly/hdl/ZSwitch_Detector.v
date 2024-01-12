///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: ZSwitch_Detector.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::PolarFireSoC> <Die::MPFS250T_ES> <Package::FCVG484>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

//`timescale <time_units> / <precision>

module ZSwitch_Detector(iClk, iRstN, iSw, oSwDown, oSwUp);
input iClk, iRstN;
input iSw;
output reg oSwDown;
output reg oSwUp;

//delay 2 clocks to sync to the main clock.
reg SwDelay1;
reg SwDelay2;
always @(posedge iClk or negedge iRstN)
if(!iRstN) begin
        SwDelay1<=1'b1;
        SwDelay2<=1'b1;
end
else begin
    SwDelay1<=iSw;
    SwDelay2<=SwDelay1;
end

wire SwFalling;
wire SwRising;
assign SwFalling=(SwDelay2 & (~SwDelay1));
assign SwRising=((~SwDelay2) & SwDelay1);

//delay 20ms to debound. 
//f=100MHz
//t=1/100MHz(s)=1000/100MHz(ms)=1000,000/100MHz(us)=1/100(us)=1000/100(ns)=10(ns).
//20ms/10ns=20,000,000(ns)/10(ns)=2,000,000.
reg [20:0] CNT1;
parameter DEADLINE_CNT1=2_000_000;

//driven by step i.
reg [7:0] iStep;
always @(posedge iClk or negedge iRstN)
if(!iRstN) begin
    iStep<=0;
end
else begin
    case(iStep)
        0: 
            begin
                if(SwFalling) begin //Falling edge detect.
                    CNT1<=0;
                    iStep<=1;
                end

                if(SwRising) begin //Rising edge detect.
                    CNT1<=0;
                    iStep<=2;
                end
            end
        1: //delay 20ms to debound falling.
            if(CNT1==DEADLINE_CNT1) begin
                //Falling edge, check level again.
                //if it's 0, the switch was realistic pressed down.
                if(SwDelay2==1'b0) begin 
                    iStep<=3;
                end
                else begin
                    iStep<=0;
                end
            end
            else begin
                CNT1<=CNT1+1'b1;
            end
        2: //delay 20ms to debound rising.
            begin
                if(CNT1==DEADLINE_CNT1) begin
                    //Rising edge, check level again.
                    //if it's 1, the swich was realistic released.
                    if(SwDelay2==1'b1) begin 
                        iStep<=5;
                    end
                    else begin
                        iStep<=0;
                    end
                end
                else begin
                    CNT1<=CNT1+1'b1;
                end
            end
        3: //output single pulse Switch Down.
            begin
                oSwDown<=1'b1;
                iStep<=iStep+1'b1;
            end
        4:
            begin
                oSwDown<=1'b0;
                iStep<=0;
            end
        5: //output single pulse Switch Up.
            begin
                oSwUp<=1'b1;
                iStep<=iStep+1'b1;
            end
        6:
            begin
                oSwUp<=1'b0;
                iStep<=0;
            end
    endcase
end
endmodule

