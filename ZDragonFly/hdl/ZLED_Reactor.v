///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: ZLED_Reactor.v
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

module ZLED_Reactor( iClk, iRstN, iSwDown, iSwUp, oLed );
input iClk, iRstN;
input iSwDown;
input iSwUp;
output reg oLed;


always @(posedge iClk or negedge iRstN)
if(!iRstN) begin
    oLed<=1'b0;
end
else begin
    if(iSwDown) begin
        oLed<=1'b1;
    end
    else if(iSwUp) begin
        oLed<=1'b0;
    end
end
endmodule

