//This module will act as a means to convert output x and y to render x and y. Will use simple nearest-neighbor.
//fast upscaler will use simple bit shifting
module fast_upscaler #(parameter coordWidth=16, parameter log2HScale=2, parameter log2VScale=2, parameter rendWidth=8)
(
    input [coordWidth-1:0] x,
    input [coordWidth-1:0] y,
    output [rendWidth-1:0] rendX,
    output [rendWidth-1:0] rendy
);

    assign rendX = x[log2HScale+rendWidth-1:log2HScale];
    assign rendY = y[log2HScale+rendWidth-1:log2HScale];

endmodule