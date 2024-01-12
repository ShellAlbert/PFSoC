//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Jan 12 14:16:39 2024
// Version: 2023.2 2023.2.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// ZDragonFly
module ZDragonFly(
    // Inputs
    iClk,
    iSw1,
    iSw2,
    iSw3,
    iSw4,
    // Outputs
    LED1,
    LED2,
    LED3,
    LED4
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  iClk;
input  iSw1;
input  iSw2;
input  iSw3;
input  iSw4;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output LED1;
output LED2;
output LED3;
output LED4;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   iClk;
wire   iSw1;
wire   iSw2;
wire   iSw3;
wire   iSw4;
wire   LED1_net_0;
wire   LED2_net_0;
wire   LED3_net_0;
wire   LED4_net_0;
wire   PF_CCC_C0_0_OUT0_FABCLK_0;
wire   PF_CCC_C0_0_PLL_LOCK_0;
wire   PF_OSC_C0_0_RCOSC_160MHZ_GL;
wire   ZSwitch_Module_0_oSwDown4;
wire   ZSwitch_Module_0_oSwUp4;
wire   LED1_net_1;
wire   LED2_net_1;
wire   LED3_net_1;
wire   LED4_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   VCC_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net = 1'b1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign LED1_net_1 = LED1_net_0;
assign LED1       = LED1_net_1;
assign LED2_net_1 = LED2_net_0;
assign LED2       = LED2_net_1;
assign LED3_net_1 = LED3_net_0;
assign LED3       = LED3_net_1;
assign LED4_net_1 = LED4_net_0;
assign LED4       = LED4_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_CCC_C0
PF_CCC_C0 PF_CCC_C0_0(
        // Inputs
        .REF_CLK_0         ( PF_OSC_C0_0_RCOSC_160MHZ_GL ),
        .PLL_POWERDOWN_N_0 ( VCC_net ),
        // Outputs
        .OUT0_FABCLK_0     ( PF_CCC_C0_0_OUT0_FABCLK_0 ),
        .PLL_LOCK_0        ( PF_CCC_C0_0_PLL_LOCK_0 ) 
        );

//--------PF_OSC_C0
PF_OSC_C0 PF_OSC_C0_0(
        // Outputs
        .RCOSC_160MHZ_GL ( PF_OSC_C0_0_RCOSC_160MHZ_GL ) 
        );

//--------ZLED_Indicator
ZLED_Indicator ZLED_Indicator_0(
        // Inputs
        .iClk  ( PF_CCC_C0_0_OUT0_FABCLK_0 ),
        .iRstN ( PF_CCC_C0_0_PLL_LOCK_0 ),
        // Outputs
        .oLed  ( LED1_net_0 ) 
        );

//--------ZLED_Indicator
ZLED_Indicator ZLED_Indicator_1(
        // Inputs
        .iClk  ( iClk ),
        .iRstN ( PF_CCC_C0_0_PLL_LOCK_0 ),
        // Outputs
        .oLed  ( LED2_net_0 ) 
        );

//--------ZLED_Indicator
ZLED_Indicator ZLED_Indicator_2(
        // Inputs
        .iClk  ( PF_CCC_C0_0_OUT0_FABCLK_0 ),
        .iRstN ( PF_CCC_C0_0_PLL_LOCK_0 ),
        // Outputs
        .oLed  ( LED3_net_0 ) 
        );

//--------ZLED_Reactor
ZLED_Reactor ZLED_Reactor_0(
        // Inputs
        .iClk    ( PF_CCC_C0_0_OUT0_FABCLK_0 ),
        .iRstN   ( PF_CCC_C0_0_PLL_LOCK_0 ),
        .iSwDown ( ZSwitch_Module_0_oSwDown4 ),
        .iSwUp   ( ZSwitch_Module_0_oSwUp4 ),
        // Outputs
        .oLed    ( LED4_net_0 ) 
        );

//--------ZSwitch_Module
ZSwitch_Module ZSwitch_Module_0(
        // Inputs
        .iClk     ( PF_CCC_C0_0_OUT0_FABCLK_0 ),
        .iRstN    ( PF_CCC_C0_0_PLL_LOCK_0 ),
        .iSw1     ( iSw1 ),
        .iSw2     ( iSw2 ),
        .iSw3     ( iSw3 ),
        .iSw4     ( iSw4 ),
        // Outputs
        .oSwDown1 (  ),
        .oSwUp1   (  ),
        .oSwDown2 (  ),
        .oSwUp2   (  ),
        .oSwDown3 (  ),
        .oSwUp3   (  ),
        .oSwDown4 ( ZSwitch_Module_0_oSwDown4 ),
        .oSwUp4   ( ZSwitch_Module_0_oSwUp4 ) 
        );


endmodule
