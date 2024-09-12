module polarity_changer #(parameter HPOL=0, parameter VPOL=1)
(
    input hsync,
    input vsync,
    output hsynco,
    output vsynco);

    generate
        if(HPOL==1) begin
            assign hsynco = ~hsync;
        end else begin
            assign hsynco =~hsync;
        end
    endgenerate


    generate
        if(VPOL==1) begin
            assign vsynco = ~vsync;
        end else begin
            assign vsynco = vsync;
        end
    endgenerate
endmodule