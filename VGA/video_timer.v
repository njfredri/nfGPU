//A timer that generates the h-sync and v-sync signals. Will also directly output what (x,y) it is on.
module Video_Timer #(
    parameter hactive = 800, //active image
    parameter hs = 80, //length of hsync
    parameter hfporch = 32, //front porch
    parameter hbporch = 112, //back porch
    parameter vactive = 600,
    parameter vs = 4, //
    parameter vfporch = 3,
    parameter vbporch = 17,
    parameter xbitWidth = 16,
    parameter ybitWidth = 16
) (
    input clk, //clock is assumed to match the pixel clock
    input rst,
    output hsync,
    output vsync,
    output [xbitWidth:0] x,
    output [ybitWidth:0] y,
    output validpixel);
    
    parameter hblank = h


endmodule