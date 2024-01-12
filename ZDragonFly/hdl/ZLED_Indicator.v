///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: ZLED_Indicator.v
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

module ZLED_Indicator( iClk, iRstN, oLed );
input iClk, iRstN;
output reg oLed;

reg [31:0] CNT1;
//<statements>
always @(posedge iClk or negedge iRstN)
if(!iRstN) begin
         CNT1<=0;  
    end
else begin
        if(CNT1==32'd25_000_000)
            CNT1<=0;
        else
            CNT1<=CNT1+1'b1;
    end
    
//////////////////////
always @(posedge iClk or negedge iRstN)
if(!iRstN) begin
         oLed<=1'b0; 
    end
else begin
        if(CNT1<32'd12_000_000)
            oLed<=1'b1;
        else
            oLed<=1'b0;
    end

endmodule

