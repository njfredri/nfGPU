module 10bit_to_16bit_color (
    input [9:0] bit10,
    output [15:0] bit16
)


//arrr ggg bbb to //a rrrrr ggggg bbbbb //copy lsb
//              a           rrr         r       r         ggg         g         g       bbb         b         b
assign bit16 = {bit10[9], bit10[8:6], bit10[6], bit10[6], bit10[5:3], bit[3], bit[3], bit10[2:0], bit10[0], bit10[0]}


endmodule