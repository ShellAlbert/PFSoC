// *********************************************************************/ 
// Copyright (c) 2019 Microsemi Corporation.  All rights reserved.  
// 
// Any use or redistribution in part or in whole must be handled in 
// accordance with the Microsemi license agreement and must be approved 
// in advance in writing.  
//  
// File: pll_ext_feedback_mode_soft_logic.v
//     
// Description: Soft logic for re-synchronizations of outputs in 
//              'External' and 'Post-Divider' feedback modes
//
// *********************************************************************
module PF_CCC_C0_PF_CCC_C0_0_PLL_EXT_FEEDBACK_MODE_RTL( FREF, RESET_N, POWERDOWN_N, OUTx_EN ) /* synthesis syn_radhardlevel = "tmr" syn_hier = "fixed" */;

input        FREF;
input        RESET_N;
output wire  POWERDOWN_N;
output wire  OUTx_EN;
parameter    NUM_CLK_CYCLES_TO_WAIT_AFTER_DISABLING_DIVIDERS = 16'b0000000011001000;
parameter    NUM_CLK_CYCLES_TO_WAIT_AFTER_ENABLING_DIVIDERS  = 16'b0000000011001000;

reg          OUTx_EN_reg;
reg          POWERDOWN_N_reg;
reg [2:0]    state;
reg [2:0]    next_state;
reg [15:0]   clk_cycle_count;

localparam   IDLE = 0;                                     
localparam   Step_1 = 1;
localparam   Step_2 = 2;
localparam   Step_3 = 3;
localparam   Step_4 = 4;
localparam   Step_5 = 5;
localparam   Step_6 = 6;

assign POWERDOWN_N = POWERDOWN_N_reg;
assign OUTx_EN = OUTx_EN_reg; 

always @ (negedge FREF or negedge RESET_N)
begin : FSM
    if (RESET_N == 1'b0)
        begin
            state <= IDLE;
        end
    else
        begin
            state <= next_state;
        end
end


always @ (*)
begin : FSM_next_state
    case (state)

        IDLE:
	    if (clk_cycle_count == 16'b0)
                next_state = Step_1; 
            else
                next_state = IDLE;
   
        Step_1:
            if (clk_cycle_count >= NUM_CLK_CYCLES_TO_WAIT_AFTER_DISABLING_DIVIDERS) 
                next_state = Step_2; 
            else
                next_state = Step_1;         
        
        Step_2:
            if (clk_cycle_count == 16'b0)
                next_state = Step_3;
            else
                next_state = Step_2; 
                
        Step_3:
            if (clk_cycle_count >= NUM_CLK_CYCLES_TO_WAIT_AFTER_ENABLING_DIVIDERS) 
                next_state = Step_4; 
            else
                next_state = Step_3;

	Step_4:
	    if (clk_cycle_count == 16'b0)
                next_state = Step_5;
            else
                next_state = Step_4;

	Step_5:
	    if (clk_cycle_count >= NUM_CLK_CYCLES_TO_WAIT_AFTER_DISABLING_DIVIDERS) 
                next_state = Step_6;
            else
                next_state = Step_5;

        Step_6:
            next_state = Step_6;


        default:
            next_state = IDLE;
    endcase
end

always @ (negedge FREF or negedge RESET_N)
begin:FSM_output_assign
    if (RESET_N == 1'b0)
        begin
            clk_cycle_count <= 16'b0;
            POWERDOWN_N_reg <= 1'b0;
            OUTx_EN_reg <= 1'b0;
        end
    else
        begin
            case(state)
 
                IDLE:
                    begin
                        clk_cycle_count <= 16'b0;
                        POWERDOWN_N_reg <= 1'b0; // assert Powerdown
                    end
 
                Step_1:
                    begin
                        clk_cycle_count <= clk_cycle_count+1'b1;
                    end

                Step_2:
                    begin
                        clk_cycle_count <= 16'b0;
                        OUTx_EN_reg <= 1'b0;     // disable all output dividers 
                    end

                Step_3:
                    begin
                        clk_cycle_count <= clk_cycle_count+1'b1;
                    end

                Step_4:
                    begin
                        clk_cycle_count <= 16'b0;
                        POWERDOWN_N_reg <= 1'b1; // de-assert Powerdown
                    end

                Step_5:
                    begin
                        clk_cycle_count <= clk_cycle_count+1'b1;
                    end

                Step_6:
                    begin
                        clk_cycle_count <= 16'b0;
                        OUTx_EN_reg <= 1'b1; // enable all output dividers
                    end
	        
            endcase
        end 
end

endmodule
