module FIRLPF(
       input                     Clock,
       input                     Rst_n,
       input      signed  [31:0] InputData1,
       output reg signed  [31:0] OutputData    
);

parameter COEFF_00 = 13'sd5;
parameter COEFF_01 = 13'sd5;
parameter COEFF_02 = 13'sd5;
parameter COEFF_03 = 13'sd2;
parameter COEFF_04 = -13'sd2;
parameter COEFF_05 = -13'sd9;
parameter COEFF_06 = -13'sd15;
parameter COEFF_07 = -13'sd12;
parameter COEFF_08 =  13'sd10;
parameter COEFF_09 =  13'sd67;
parameter COEFF_10 =  13'sd178;
parameter COEFF_11 =  13'sd359;
parameter COEFF_12 =  13'sd621;
parameter COEFF_13 =  13'sd964;
parameter COEFF_14 =  13'sd1374;
parameter COEFF_15 =  13'sd1823;
parameter COEFF_16 =  13'sd2269;
parameter COEFF_17 =  13'sd2664;
parameter COEFF_18 =  13'sd2959;
parameter COEFF_19 =  13'sd3117;
parameter COEFF_20 =  13'sd3117;
parameter COEFF_21 =  13'sd2959;
parameter COEFF_22 =  13'sd2664;
parameter COEFF_23 =  13'sd2269;
parameter COEFF_24 =  13'sd1823;
parameter COEFF_25 =  13'sd1374;
parameter COEFF_26 =  13'sd964;
parameter COEFF_27 =  13'sd621;
parameter COEFF_28 =  13'sd359;
parameter COEFF_29 =  13'sd178;
parameter COEFF_30 =  13'sd67;
parameter COEFF_31 =  13'sd10;
parameter COEFF_32 = -13'sd12;
parameter COEFF_33 = -13'sd15;
parameter COEFF_34 = -13'sd9;
parameter COEFF_35 = -13'sd2;
parameter COEFF_36 = 13'sd2;
parameter COEFF_37 = 13'sd5;
parameter COEFF_38 = 13'sd5;
parameter COEFF_39 = 13'sd5;

wire signed[31:0] InputData;

assign InputData = 32'sd655361;

reg [5:0]	Count;

always @(posedge Clock or negedge Rst_n)
begin
  if(Rst_n==1'b0)
    Count<=6'd0;
  else if(Count<6'd39)
    Count<=Count+6'd1;
  else
    Count<=6'd0;      
end	 

reg signed [39:0] FIRSum;

always @(posedge Clock or negedge Rst_n)
begin
  if(Rst_n==1'b0)
    FIRSum<=40'sd0;
  else 
    case(Count)
    	6'd0:FIRSum<=InputData*COEFF_00;
    	6'd1:FIRSum<=FIRSum+InputData*COEFF_01;
    	6'd2:FIRSum<=FIRSum+InputData*COEFF_02;
    	6'd3:FIRSum<=FIRSum+InputData*COEFF_03;
    	6'd4:FIRSum<=FIRSum+InputData*COEFF_04;
    	6'd5:FIRSum<=FIRSum+InputData*COEFF_05;
    	6'd6:FIRSum<=FIRSum+InputData*COEFF_06;
    	6'd7:FIRSum<=FIRSum+InputData*COEFF_07;
    	6'd8:FIRSum<=FIRSum+InputData*COEFF_08;   
    	6'd9:FIRSum<=FIRSum+InputData*COEFF_09; 
     6'd10:FIRSum<=FIRSum+InputData*COEFF_10; 
     6'd11:FIRSum<=FIRSum+InputData*COEFF_11;
     6'd12:FIRSum<=FIRSum+InputData*COEFF_12;
     6'd13:FIRSum<=FIRSum+InputData*COEFF_13;
     6'd14:FIRSum<=FIRSum+InputData*COEFF_14;
     6'd15:FIRSum<=FIRSum+InputData*COEFF_15;
     6'd16:FIRSum<=FIRSum+InputData*COEFF_16;
     6'd17:FIRSum<=FIRSum+InputData*COEFF_17;
     6'd18:FIRSum<=FIRSum+InputData*COEFF_18;   
     6'd19:FIRSum<=FIRSum+InputData*COEFF_19; 
     6'd20:FIRSum<=FIRSum+InputData*COEFF_20; 
     6'd21:FIRSum<=FIRSum+InputData*COEFF_21;
     6'd22:FIRSum<=FIRSum+InputData*COEFF_22;
     6'd23:FIRSum<=FIRSum+InputData*COEFF_23;
     6'd24:FIRSum<=FIRSum+InputData*COEFF_24;
     6'd25:FIRSum<=FIRSum+InputData*COEFF_25;
     6'd26:FIRSum<=FIRSum+InputData*COEFF_26;
     6'd27:FIRSum<=FIRSum+InputData*COEFF_27;
     6'd28:FIRSum<=FIRSum+InputData*COEFF_28;   
     6'd29:FIRSum<=FIRSum+InputData*COEFF_29; 
     6'd30:FIRSum<=FIRSum+InputData*COEFF_30; 
     6'd31:FIRSum<=FIRSum+InputData*COEFF_31;
     6'd32:FIRSum<=FIRSum+InputData*COEFF_32;
     6'd33:FIRSum<=FIRSum+InputData*COEFF_33;
     6'd34:FIRSum<=FIRSum+InputData*COEFF_34;
     6'd35:FIRSum<=FIRSum+InputData*COEFF_35;
     6'd36:FIRSum<=FIRSum+InputData*COEFF_36;
     6'd37:FIRSum<=FIRSum+InputData*COEFF_37;
     6'd38:FIRSum<=FIRSum+InputData*COEFF_38;   
     6'd39:FIRSum<=FIRSum+InputData*COEFF_39;
     default:FIRSum<=FIRSum;                	    	  	    	
    endcase	    
end	 

reg signed [24:0] FIRSum_Reg0;
reg signed [24:0] FIRSum_Reg1;
reg signed [24:0] FIRSum_Reg2;
reg signed [24:0] FIRSum_Reg3;
reg signed [24:0] FIRSum_Reg4;
reg signed [24:0] FIRSum_Reg5;
reg signed [24:0] FIRSum_Reg6;
reg signed [24:0] FIRSum_Reg7;

reg signed [27:0] FIRSum_RegSum;


always @(posedge Clock or negedge Rst_n)
begin
  if(Rst_n==1'b0)
    begin
    FIRSum_Reg0<=25'sd0;
    FIRSum_Reg1<=25'sd0;
    FIRSum_Reg2<=25'sd0;
    FIRSum_Reg3<=25'sd0;
    FIRSum_Reg4<=25'sd0;
    FIRSum_Reg5<=25'sd0;
    FIRSum_Reg6<=25'sd0;
    FIRSum_Reg7<=25'sd0;
    FIRSum_RegSum<=28'sd0;
    end
  else 
    case(Count)
    	6'd0:
		    begin
		    FIRSum_Reg0<=FIRSum[39:15];
		    FIRSum_Reg1<=FIRSum_Reg0;
		    FIRSum_Reg2<=FIRSum_Reg1;
		    FIRSum_Reg3<=FIRSum_Reg2;
		    FIRSum_Reg4<=FIRSum_Reg3;
		    FIRSum_Reg5<=FIRSum_Reg4;
		    FIRSum_Reg6<=FIRSum_Reg5;
		    FIRSum_Reg7<=FIRSum_Reg6;
		    OutputData<={{7{FIRSum_RegSum[27]}},FIRSum_RegSum[27:3]};
		    end
    	6'd1:FIRSum_RegSum<={{3{FIRSum_Reg0[24]}},FIRSum_Reg0};
    	6'd2:FIRSum_RegSum<=FIRSum_RegSum+{{3{FIRSum_Reg1[24]}},FIRSum_Reg1};
    	6'd3:FIRSum_RegSum<=FIRSum_RegSum+{{3{FIRSum_Reg2[24]}},FIRSum_Reg2};
    	6'd4:FIRSum_RegSum<=FIRSum_RegSum+{{3{FIRSum_Reg3[24]}},FIRSum_Reg3};
    	6'd5:FIRSum_RegSum<=FIRSum_RegSum+{{3{FIRSum_Reg4[24]}},FIRSum_Reg4};
    	6'd6:FIRSum_RegSum<=FIRSum_RegSum+{{3{FIRSum_Reg5[24]}},FIRSum_Reg5};
    	6'd7:FIRSum_RegSum<=FIRSum_RegSum+{{3{FIRSum_Reg6[24]}},FIRSum_Reg6};
    	6'd8:FIRSum_RegSum<=FIRSum_RegSum+{{3{FIRSum_Reg7[24]}},FIRSum_Reg7};
		default:FIRSum_RegSum<=FIRSum_RegSum;
    endcase
end
endmodule 
