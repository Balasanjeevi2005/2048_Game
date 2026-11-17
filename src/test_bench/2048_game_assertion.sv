module assertion(
  input Clk,Rst_n,ena,
  input[7:0]Ui_in,Uio_in,
  output[7:0]Uo_out,Uio_out,Uio_oe;
);
  
  property reset_assertion_test;
    @(posedge Clk);
    if(!Rst_n)
      Uo_out ==  8'h00;
  endproperty
  
  property hsync_assertion_test;
    @(posedge Clk);
    disable iff(!Rst_n)
    $fell(Uo_out[7]) |-> !Uo_out[7][*96]##1Uo_out[7][*704] ;
  endproperty
  
  property vsync_assertion_test;
    @(posedge Clk);
    disable iff(!Rst_n)
    $fell(Uo_out[3]) |-> !Uo_out[3][*2]##1Uo_out[3];
  endproperty
  
  property uio_tied_low_assertion_test;
    @(posedge Clk);
    disable iff(!Rst_n)begin
      Uio_out == 8'h00;
      Uio_oe  == 8'h00;
    end
  endproperty
    
  property frame_length_assertion_test;
    @(posedge Clk);
    disable iff(!Rst_n)
      Uo_out ==  8'h00;
  endproperty
  
  property uo_out_known_assertion_test;
    @(posedge Clk);
    !$isunknown(Uo_out);
  endproperty
  
  assert property(reset_assertion_test);
  assert property(hsync_assertion_test);
  assert property(vsync_assertion_test);
    
  assert property(uio_tied_low_assertion_test);
  assert property(frame_length_assertion_test);
    assert property(uo_out_known_assertion_test);
  
endmodule
