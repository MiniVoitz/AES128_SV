//==============================================================================
//  Filename    : Finite-State Machine                                              
//  Designer    : TV & HD
//  Description : Main FSM
//==============================================================================
module fsm (
  input  logic       clk,               // Main Clock
  input  logic       reset,             // Synchronous Active High Reset (More Robust mapping on FPGA)
  output logic[0:3]    keyInit,
  output logic         sel,
  output logic         sel2,
  output logic         buffer1en,
  output logic         buffer2en,
  output logic         buffer3en,
  output logic         buffer4en,
  output logic         buffer5en,
  output logic         buffer6en
  
);

// == Variables Declaration ====================================================
  typedef enum  { store, tempo, firstaddround, round, transfer , lastkey,  lastround
   } fsm_t;
fsm_t     state,next_state;

logic [0:4] i;



always_ff @(posedge clk, posedge reset)
    if      (reset)            i <= 0;
    else if (state == round) i <= i + 1;
    else if (state == firstaddround) i <= 1;
    else if (state == store) i <= 1;
    else                 ;

// == Main Code ================================================================

always_ff @(posedge clk,posedge reset)
    if   (reset) state <= store;
    else         state <= next_state;


always_comb  
  begin
    buffer1en = 0;
    buffer2en = 0;
    buffer3en = 0;
    buffer4en = 0;
    buffer5en = 0;
    buffer6en = 0;
    keyInit = 0;
    sel = 0;
    sel2 = 0;
    next_state      = state;


    
    unique case (state) 
      store :  begin
                  buffer1en = 1;
                  buffer2en = 1;
                  next_state   = firstaddround;
                  end

      firstaddround :  begin
                  buffer3en = 1;
                  buffer6en = 1;
                  next_state   = tempo;
                  end

      tempo : begin
                  sel2 = 1;
                  buffer2en = 1;
                  next_state = round;
      end

      round : begin
		            buffer4en = 1;
		            buffer6en = 1;
		            keyInit = i;
                next_state= (i > 8) ? lastkey : transfer;
                  end

      transfer : begin
                sel=1;
                sel2=1;
                buffer2en = 1;
                buffer3en = 1;
                  next_state = round;
                  end

      lastkey : begin
                sel2=1;
                buffer2en = 1;
                keyInit = i;
                next_state = lastround;
      end
      lastround : begin
                buffer5en = 1;
                next_state= store;
		                end
	    default:
		      next_state=store;
    endcase
end



endmodule
