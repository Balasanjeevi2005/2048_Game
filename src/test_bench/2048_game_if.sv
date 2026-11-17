interface game_if(input Clk);
  
  bit Rst_n;
  logic ena;
  logic[7:0]Ui_in,Uio_in;;
  logic[7:0]Uo_out,Uio_out,Uio_oe;
  
  clocking drv_cb @(posedge clk);
    default input#1 output#1
    input Rst_n,ena,Ui_in,Uio_in;
  endclocking
  
  clocking inp_mon_cb @(posedge clk);
    default input#1 output#1
    input ena,Ui_in,Uio_in;
  endclocking
  
  clocking out_mon_cb @(posedge clk);
    default input#1 output#1
    input Uo_out,Uio_out,Uio_oe;
  endclocking
  
  modport DRV(clocking drv_cb);
  modport INP_MON(clocking inp_mon_cb);
  modport OUT_MON(clocking out_mon_cb);
  
endinterface 
