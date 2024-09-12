module video_driver #(`include "video_params.v")
(
    input clk,
    input rst,
    input [bitsPerPixel-1:0] color,
    output [renderCoordinateWidth-1:0] rendX,
    output [renderCoordinateWidth-1:0] rendY,
    output valid,
    output hSync,
    output vSync,
    output [bitsPerColorOutput-1:0] red,
    output [bitsPerColorOutput-1:0] green,
    output [bitsPerColorOutput-1:0] blue
);
    //video timer setup
    wire hsync_timer2pol, vsync_timer2pol;
    wire [timerCoordinateWidth-1:0] x_timer2scaler;
    wire [timerCoordinateWidth-1:0] y_timer2scaler;
    Video_Timer vidTimer #(
        .hactive(hactive),
        .hs(hSyncLength),
        .hfporch(hFront),
        .hbporch(hBack),
        .vactive(vactive),
        .vs(vSyncLength),
        .vfporch(vFront),
        .vbporch(vBack),
        .xbitWidth(timerCoordinateWidth),
        .ybitWidth(timerCoordinateWidth)
        )
        (
        .clk(clk),
        .rst(rst),
        .hsync(hsync_timer2pol),
        .vsync(vsync_timer2pol),
        .x(x_timer2scaler),
        .y(y_timer2scaler),
        .validpixel(valid)
    );

    //setup polarity changer
    // module polarity_changer #(parameter HPOL=0, parameter VPOL=1)
    // (
    // input hsync,
    // input vsync,
    // output hsynco,
    // output vsynco);
    polarity_changer polar #(.HPOL(hPolarity), .VPOL(vPolarity))(
        
    );
endmodule