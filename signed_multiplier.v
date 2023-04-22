`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2023 08:59:10
// Design Name: 
// Module Name: signed_multiplier
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module signed_multiplier(a,b,z);
input[7:0]a,b; 
output[15:0]z;
wire p[7:0][7:0];
wire [15:0]q1;
wire [14:0]q2,add_1_sum;
wire [13:0]q3, add_2_sum;
wire [12:0]q4,add_3_sum ;
wire [11:0]q5,add_4_sum;
wire [10:0]q6,add_5_sum;
wire [9:0]q7,add_6_sum;
wire [8:0]q8,q8_inv;
wire cin=0,cin1=1;
wire cout;

genvar g;
generate
for(g=0; g<8; g=g+1)begin
and A0 (p[0][g],a[0],b[g]);
and A1 (p[1][g],a[1],b[g]);
and A2 (p[2][g],a[2],b[g]);
and A3 (p[3][g],a[3],b[g]);
and A4 (p[4][g],a[4],b[g]);
and A5 (p[5][g],a[5],b[g]);
and A6 (p[6][g],a[6],b[g]);
and A7 (p[7][g],a[7],b[g]);
end 
endgenerate
assign q1={p[7][0],p[7][0],p[7][0],p[7][0],p[7][0],p[7][0],p[7][0],p[7][0],p[7][0],p[6][0],p[5][0],p[4][0],p[3][0],p[2][0],p[1][0],p[0][0]};
assign q2={p[7][1],p[7][1],p[7][1],p[7][1],p[7][1],p[7][1],p[7][1],p[7][1],p[6][1],p[5][1],p[4][1],p[3][1],p[2][1],p[1][1],p[0][1]};
assign q3={p[7][2],p[7][2],p[7][2],p[7][2],p[7][2],p[7][2],p[7][2],p[6][2],p[5][2],p[4][2],p[3][2],p[2][2],p[1][2],p[0][2]};
assign q4={p[7][3],p[7][3],p[7][3],p[7][3],p[7][3],p[7][3],p[6][3],p[5][3],p[4][3],p[3][3],p[2][3],p[1][3],p[0][3]};
assign q5={p[7][4],p[7][4],p[7][4],p[7][4],p[7][4],p[6][4],p[5][4],p[4][4],p[3][4],p[2][4],p[1][4],p[0][4]};
assign q6={p[7][5],p[7][5],p[7][5],p[7][5],p[6][5],p[5][5],p[4][5],p[3][5],p[2][5],p[1][5],p[0][5]};
assign q7={p[7][6],p[7][6],p[7][6],p[6][6],p[5][6],p[4][6],p[3][6],p[2][6],p[1][6],p[0][6]};
assign q8={p[7][7],p[7][7],p[6][7],p[5][7],p[4][7],p[3][7],p[2][7],p[1][7],p[0][7]};
 
 assign q8_inv = ~q8;

assign z[0]=q1[0];
assign z[1]=add_1_sum[0];
assign z[2]=add_2_sum[0];
assign z[3]=add_3_sum[0];
assign z[4]=add_4_sum[0];
assign z[5]=add_5_sum[0];
assign z[6]=add_6_sum[0];

rca_adder #(15) add_1(.A(q1[15:1]),.B(q2),.CIN(cin),.COUT(cout),.SUM(add_1_sum));
rca_adder #(14) add_2(.A(add_1_sum[14:1]),.B(q3),.CIN(cin),.COUT(cout),.SUM(add_2_sum));
rca_adder #(13) add_3(.A(add_2_sum[13:1]),.B(q4),.CIN(cin),.COUT(cout),.SUM(add_3_sum));
rca_adder #(14) add_4(.A(add_3_sum[12:1]),.B(q5),.CIN(cin),.COUT(cout),.SUM(add_4_sum));
rca_adder #(13) add_5(.A(add_4_sum[11:1]),.B(q6),.CIN(cin),.COUT(cout),.SUM(add_5_sum));
rca_adder #(13) add_6(.A(add_5_sum[10:1]),.B(q7),.CIN(cin),.COUT(cout),.SUM(add_6_sum));
rca_adder #(13) add_7(.A(add_6_sum[9:1]),.B(q8_inv),.CIN(cin1),.COUT(cout),.SUM(z[15:7]));
endmodule
                                                                                                                                 