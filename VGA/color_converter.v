module color_converter #(
    parameter bpc=4,
    parameter bpc_out=4,
    parameter RCoorBits = 8; //doing just 8 for now as it's 256x180 image.
    )
(
    input clk,
    input rst,
    input [(bpc*3)-1:0] rgb,
    output [bpc_out-1:0] red,
    output [bpc_out-1:0] green,
    output [bpc_out-1:0] blue,
);

localparam bpcLargerDiff = bpc - bpc_out; //if bpc > bpc_out
localparam bpcSmallerDiff = bpc_out - bpc; //if bpc < bpc_out

wire [bpc-1:0] r, g, b; //r is LSB, B is MSB
assign r = rgb[bpc-1:0];
assign g = rgb[(bpc*2)-1:bpc];
assign b = rgb[(bpc*3)-1:bpc*2];


//Convert different color format lengths. Assume all colors have same number of bits
generate
    if(bpc == bpc_out) begin
        assign red = r;
        assign green = g;
        assign blue = b;
    end 
    else if (bpc < bpc_out) begin
        assign red = {r, bpcSmallerDiff{1'b0}}
        assign green = {g, bpcSmallerDiff{1'b0}}
        assign blue = {b, bpcSmallerDiff{1'b0}}
    end
    else begin
        assign red = r[bpc-1:bpc-bpc_out];
        assign green = g[bpc-1:bpc-bpc_out];
        assign blue = b[bpc-1:bpc-bpc_out];
    end
endgenerate

endmodule