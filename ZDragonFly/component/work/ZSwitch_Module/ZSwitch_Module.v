//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Jan 12 14:10:19 2024
// Version: 2023.2 2023.2.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// ZSwitch_Module
module ZSwitch_Module(
    // Inputs
    iClk,
    iRstN,
    iSw1,
    iSw2,
    iSw3,
    iSw4,
    // Outputs
    oSwDown1,
    oSwDown2,
    oSwDown3,
    oSwDown4,
    oSwUp1,
    oSwUp2,
    oSwUp3,
    oSwUp4
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  iClk;
input  iRstN;
input  iSw1;
input  iSw2;
input  iSw3;
input  iSw4;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output oSwDown1;
output oSwDown2;
output oSwDown3;
output oSwDown4;
output oSwUp1;
output oSwUp2;
output oSwUp3;
output oSwUp4;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   iClk;
wire   iRstN;
wire   iSw1;
wire   iSw2;
wire   iSw3;
wire   iSw4;
wire   oSwDown1_net_0;
wire   oSwDown2_net_0;
wire   oSwDown3_net_0;
wire   oSwDown4_net_0;
wire   oSwUp1_net_0;
wire   oSwUp2_net_0;
wire   oSwUp3_net_0;
wire   oSwUp4_net_0;
wire   oSwDown1_net_1;
wire   oSwUp1_net_1;
wire   oSwDown2_net_1;
wire   oSwUp2_net_1;
wire   oSwDown3_net_1;
wire   oSwUp3_net_1;
wire   oSwDown4_net_1;
wire   oSwUp4_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign oSwDown1_net_1 = oSwDown1_net_0;
assign oSwDown1       = oSwDown1_net_1;
assign oSwUp1_net_1   = oSwUp1_net_0;
assign oSwUp1         = oSwUp1_net_1;
assign oSwDown2_net_1 = oSwDown2_net_0;
assign oSwDown2       = oSwDown2_net_1;
assign oSwUp2_net_1   = oSwUp2_net_0;
assign oSwUp2         = oSwUp2_net_1;
assign oSwDown3_net_1 = oSwDown3_net_0;
assign oSwDown3       = oSwDown3_net_1;
assign oSwUp3_net_1   = oSwUp3_net_0;
assign oSwUp3         = oSwUp3_net_1;
assign oSwDown4_net_1 = oSwDown4_net_0;
assign oSwDown4       = oSwDown4_net_1;
assign oSwUp4_net_1   = oSwUp4_net_0;
assign oSwUp4         = oSwUp4_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------ZSwitch_Detector
ZSwitch_Detector ZSwitch_Detector_0(
        // Inputs
        .iClk    ( iClk ),
        .iRstN   ( iRstN ),
        .iSw     ( iSw1 ),
        // Outputs
        .oSwDown ( oSwDown1_net_0 ),
        .oSwUp   ( oSwUp1_net_0 ) 
        );

//--------ZSwitch_Detector
ZSwitch_Detector ZSwitch_Detector_1(
        // Inputs
        .iClk    ( iClk ),
        .iRstN   ( iRstN ),
        .iSw     ( iSw2 ),
        // Outputs
        .oSwDown ( oSwDown2_net_0 ),
        .oSwUp   ( oSwUp2_net_0 ) 
        );

//--------ZSwitch_Detector
ZSwitch_Detector ZSwitch_Detector_2(
        // Inputs
        .iClk    ( iClk ),
        .iRstN   ( iRstN ),
        .iSw     ( iSw3 ),
        // Outputs
        .oSwDown ( oSwDown3_net_0 ),
        .oSwUp   ( oSwUp3_net_0 ) 
        );

//--------ZSwitch_Detector
ZSwitch_Detector ZSwitch_Detector_3(
        // Inputs
        .iClk    ( iClk ),
        .iRstN   ( iRstN ),
        .iSw     ( iSw4 ),
        // Outputs
        .oSwDown ( oSwDown4_net_0 ),
        .oSwUp   ( oSwUp4_net_0 ) 
        );


endmodule
