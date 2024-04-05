//==============================================================================
//  Filename    : Finite-State Machine for the Interface                                             
//  Designer    : TV & HD
//  Description : 
//==============================================================================
module fsmInterface (
  input  logic       clk,               // Main Clock
  input  logic       reset,             // Synchronous Active High Reset (More Robust mapping on FPGA)
  input logic        initiate,
  input logic        RW,
  input logic        adress,
  output logic       load,
  output logic       CS,
  output logic       shift_in_message,
  output logic       shift_in_key,
  output logic       shift_out
);

// == Variables Declaration ====================================================
  typedef enum logic [0:2]   {Wait, WriteData, WriteKey, Read} fsm_t;
fsm_t   state,next_state;

logic [0:3] i;



always_ff @(posedge clk, posedge reset)
    if      (reset)            i <= 0;
    else if (state == Wait) i <= 0;
    else if (state == WriteData) i <= i + 1;
    else if (state == WriteKey) i <= i + 1;
    else if (state == Read) i <= i + 1;
    else                 ;

// == Main Code ================================================================

always_ff @(posedge clk,posedge reset)
    if   (reset) state <= Wait;
    else         state <= next_state;


always_comb  
  begin
    shift_in_message = 0;
    shift_in_key = 0;
    shift_out = 0;
    load = 0;
    CS=0;
    next_state      = state;


    
    unique case (state) 
      Wait :  begin
        
                  next_state   = (initiate == 0) ? Wait : ((RW == 1) ? ((adress == 1) ? WriteKey : WriteData) : Read);
                  end

      WriteData :  begin
                  shift_in_message = 1;
                  next_state   = (i >= 3) ? Wait : WriteData;
                  end

      WriteKey :  begin
                  shift_in_key = 1;
                  next_state   = (i >= 3) ? Wait : WriteKey;
                  end

      Read :  begin
                  CS = (i > 0) ? 1 : 0;
                  load = (i == 0) ? 1 : 0;
                  shift_out = (i > 0) ? 1 : 0;
                  next_state   = (i > 3) ? Wait : Read;
                  end
	    default:
		      next_state=Wait;
    endcase
end



endmodule
