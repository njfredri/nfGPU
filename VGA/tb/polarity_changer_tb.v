module polarity_changer_tb();
    reg hin, vin;
    wire[3:0] hout, vout;
    // module polarity_changer #(parameter HPOL=0, parameter VPOL=1)

    //all 4 configs
    polarity_changer #(.HPOL(0), .VPOL(0)) pc00 (.hsync(hin), .vsync(vin), .hsynco(hout[0]), .vsynco(vout[0]));
    polarity_changer #(.HPOL(0), .VPOL(1)) pc01 (.hsync(hin), .vsync(vin), .hsynco(hout[1]), .vsynco(vout[1]));
    polarity_changer #(.HPOL(1), .VPOL(0)) pc10 (.hsync(hin), .vsync(vin), .hsynco(hout[2]), .vsynco(vout[2]));
    polarity_changer #(.HPOL(1), .VPOL(1)) pc11 (.hsync(hin), .vsync(vin), .hsynco(hout[3]), .vsynco(vout[3]));

    integer checks = 0;
    integer passed = 0;

    initial begin
        hin = 0;
        vin = 0;
        #5
        hin = 0;
        vin = 1;
        #5
        hin = 1;
        vin = 0;
        #5
        hin = 1;
        vin = 1;
    end

    //check hout
    initial begin
        #1
        if(hout==4'b1100) begin //hin is 0
            passed = passed + 1;
        end
        else begin
            $display("\n Failed hin=%b. Got %b as output\n", hin, hout);
        end
        checks = checks + 1;
        #5
        if(hout==4'b1100) begin //hin is 0
            passed = passed + 1;
        end
        else begin
            $display("\n Failed hin=%b. Got %b as output\n", hin, hout);
        end
        checks = checks + 1;
        #5
        if(hout==4'b0011) begin //hin is now 1
            passed = passed + 1;
        end
        else begin
            $display("\n Failed hin=%b. Got %b as output\n", hin, hout);
        end
        checks = checks + 1;
        #5
        if(hout==4'b0011) begin
            passed = passed + 1;
        end
        else begin
            $display("\n Failed hin=%b. Got %b as output\n", hin, hout);
        end
        checks = checks + 1;
    end

    //check vout
    initial begin
        #1
        if(vout==4'b1010) begin //vin is 0. lsb is not inverted
            passed = passed + 1;
        end
        checks = checks + 1;
        #5
        if(vout==4'b0101) begin //vin is 1
            passed = passed + 1;
        end
        checks = checks + 1;
        #5
        if(vout==4'b1010) begin //vin is now 0
            passed = passed + 1;
        end
        checks = checks + 1;
        #5
        if(vout==4'b0101) begin //vin is now 1
            passed = passed + 1;
        end
        #5
        checks = checks + 1;
        $display("\n Polarity Changer Passed %d /  %d checks\n", passed, checks);
    end
endmodule