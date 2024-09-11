`timescale 1ns/1ns

module video_timer_tb();

    reg clk, rst;
    wire hsync, vsync, valid;
    wire [15:0] x, y;


    Video_Timer vt #(
    hactive = 240, //active image
    hs = 16, //length of hsync
    hfporch = 8, //front porch
    hbporch = 24, //back porch
    vactive = 160,
    vs = 10,
    vfporch = 3,
    vbporch = 6,
    xbitWidth = 16,
    ybitWidth = 16
) (
    .clk(clk),
    .rst(rst),
    .hsync(hsync),
    .vsync(vsync),
    .x(x),
    .y(y),
    .validpixel(valid)
);

parameter clk_half_period = 1;

initial begin
    clk = 0;
    forever #(clk_half_period) clk = ~clk;
end

initial begin
    rst = 0;
    #(clk_half_period*2)
    rst = 1;
    #(clk_half_period*2)
    rst = 0;
end

parameter timeout = 5000000000;

initial begin
    #(timeout) $finish
end

endmodule