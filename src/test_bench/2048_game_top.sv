module top(
  input Clk,Rst_n,ena,
  input[7:0]Ui_in,Uio_in,
  output[7:0]Uo_out,Uio_out,Uio_oe;
);
  
  game_if vif;
  bit clk = 0;
  
  initial begin
    forever #19.86 clk = ~clk;
  end
  
  initial begin
    uvm_config_db#(game_if)::set(this,"","vif",vif);
  end
  
  dut duv(
    .Clk(Clk),
    .Rst_n(vif.Rst_n),
    .ena(vif.ena),
    .Ui_in(vif.Ui_in),
    .Uio_in(vif.Uio_in),
    .Uo_out(vif.Uo_out),
    .Uio_out(vif.Uio_out),
    .Uio_oe(vif.Uio_oe)
  );
  
endmodule
