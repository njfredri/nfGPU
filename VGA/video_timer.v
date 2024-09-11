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
    output reg hsync,
    output reg vsync,
    output reg [xbitWidth-1:0] x,
    output reg [ybitWidth-1:0] y,
    output validpixel
);
    //veritcal timing: vsync -> back porch -> stream video -> front porch
    //horizontal timing: hsync -> back porch -> video stream -> front porch
    parameter hvid_start = hs + hbporch; //when actual video/image is being sent to the screen
    parameter hvid_end = hs + hbporch + hactive; //when it goes back to blanking
    parameter htotal = hs + hbporch + hactive + hfporch;

    parameter vvid_start = vs + vbporch;
    parameter vvid_end = vs + vbporch + vactive;
    parameter vtotal = vs + vbporch + vactive + hfporch;

    //check if current horizontal or vertical position is valid
    reg hvalid;
    reg vvalid;
    //check if position is valid (for image)
    assign validpixel = hvalid & vvalid;

    //horizontal movement module
    always @(posedge clk, posedge rst) begin
        if(rst == 1) begin
            x <= 0;
        end
        else begin
            //x reset
            if (x >= htotal) begin
                x <= 0; 
            end
            else begin
                x <= x + 1;
            end 
        end
    end

    //vertical movement module
    always @(posedge hsync, posedge rst) begin
        if(rst == 1) begin
            y <= 0;
        end
        else begin
            //x reset
            if (y >= vtotal) begin
                y <= 0; 
            end
            else begin
                y <= y + 1;
            end 
        end
    end

    //hsync output module
    always @(posedge clk, posedge rst) begin
        if(rst == 1) begin
            hsync <= 0;
            hvalid <= 0;
        end
        else begin
            if(x < hs) begin
                hsync <= 1;
            end
            else begin
                hsync <= 0;
            end
            if(x < hvid_start || x > hvid_end) begin
                hvalid <= 0;
            end
            else begin
                hvalid <= 1;
            end
        end
    end

    //vsync output module
    always @(posedge clk, posedge rst) begin
        if(rst == 1) begin
            vsync <= 0;
            vvalid <= 0;
        end
        else begin
            if(y < vs) begin
                vsync <= 1;
            end
            else begin
                vsync <= 0;
            end
            if(y < vvid_start || y > vvid_end) begin
                vvalid <= 0;
            end
            else begin
                vvalid <= 1;
            end
        end
    end

endmodule