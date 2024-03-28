//==============================================================================
//  Filename    : Finite-State Machine                                              
//  Designer    : TV & HD
//  Description : Main FSM
//==============================================================================
module fsm (
  input  logic       clk,               // Main Clock
  input  logic       reset,             // Synchronous Active High Reset (More Robust mapping on FPGA)
  input logic        selCypher,
  input logic         keyChange,
  output logic[0:3]    keyInit,
  output logic         sel1,
  output logic         sel2,
  output logic         sel3,
  output logic[0:3]         sel4,  
  output logic         buffer1en,
  output logic         buffer2en,
  output logic         buffer3en,
  output logic         buffer4en,
  output logic         buffer5en,
  output logic         buffer7en,
  output logic         buffer8en,
  output logic         buffer9en,
  output logic         B0en,
  output logic         B1en,
  output logic         B2en,
  output logic         B3en,
  output logic         B4en,
  output logic         B5en,
  output logic         B6en,
  output logic         B7en,
  output logic         B8en,
  output logic         B9en,
  output logic         B10en
  
);

// == Variables Declaration ====================================================
  typedef enum logic [0:3]   { Init, StorefirstKey, Storekeyi, AddRoundKeyE, TransferE, RoundE, LastroundE, AddRoundKeyD, RoundD, LastroundD, TransferD
   } fsm_t;
fsm_t   state,next_state;

logic [0:3] i;



always_ff @(posedge clk, posedge reset)
    if      (reset)            i <= 0;
    else if (state == Init) i <= 0;
    else if (state == StorefirstKey) i <= 1;
    else if (state == Storekeyi) i <= i + 1;
    else if (state == AddRoundKeyD) i <= 1;
    else if (state == AddRoundKeyE) i <= 1;
    else if (state == RoundE) i <= i + 1;
    else if (state == TransferD) i <= i + 1;
    else                 ;

// == Main Code ================================================================

always_ff @(posedge clk,posedge reset)
    if   (reset) state <= Init;
    else         state <= next_state;


always_comb  
  begin
    buffer1en = 0;
    buffer2en = 0;
    buffer3en = 0;
    buffer4en = 0;
    buffer5en = 0;
    buffer7en = 0;
    buffer8en = 0;
    buffer9en = 0;
    B0en = 0;
    B1en = 0;
    B2en = 0;
    B3en = 0;
    B4en = 0;
    B5en = 0;
    B6en = 0;
    B7en = 0;
    B8en = 0;
    B9en = 0;
    B10en = 0;
    keyInit = 0;
    sel1 = 0;
    sel2 = 0;
    sel3 = 0;
    sel4 = 0;
    next_state      = state;


    
    unique case (state) 
      Init :  begin
                  buffer1en = 1;
                  buffer2en = 1;
                  next_state   = (keyChange == 1) ? StorefirstKey : ((selCypher == 1) ? AddRoundKeyE : AddRoundKeyD);
                  end

      StorefirstKey :  begin
                  sel3 = 1;
                  B0en = 1;
                  next_state   = Storekeyi;
                  end

      Storekeyi : begin
                  unique case (i)
                  0 : B0en = 1; 
                  1 : B1en = 1; 
                  2 : B2en = 1; 
                  3 : B3en = 1; 
                  4 : B4en = 1; 
                  5 : B5en = 1; 
                  6 : B6en = 1; 
                  7 : B7en = 1; 
                  8 : B8en = 1; 
                  9 : B9en = 1; 
                  10 : B10en = 1; 
                  endcase
                  sel4 = 1;
                  keyInit = i;
                  next_state = (i <= 10) ? Storekeyi : ((selCypher == 1) ? AddRoundKeyE : AddRoundKeyD);
      end

      AddRoundKeyE : begin
		            sel4 = 0;
		            buffer3en = 1;
		            sel1 = 0;
                next_state= RoundE;
                  end

      RoundE : begin
                sel4=1;
                buffer4en=1;
                  next_state = (i > 10) ? LastroundE : TransferE;
                  end

      LastroundE : begin
                sel4=1;
                buffer5en = 1;
                next_state = Init;
      end
      TransferE : begin
                buffer3en = 1;
                sel1 = 1;
                next_state= RoundE;
		                end
      AddRoundKeyD : begin
		            sel4 = 10; //ATTENTION PEUT ETRE A ECRIRE EN NOTATION BINAIRE
                sel2 = 1;
		            buffer7en = 1;
                next_state= RoundD;
                  end

      RoundD : begin
                sel4= 10 - i;
                buffer8en=1;
                  next_state = (i == 9) ? LastroundD : TransferD;
                  end

      LastroundD : begin
                sel4=0;
                buffer9en = 1;
                next_state = Init;
      end
      TransferD : begin
                buffer7en = 1;
                sel2 = 0;
                next_state= RoundD;
		                end
	    default:
		      next_state=Init;
    endcase
end



endmodule
