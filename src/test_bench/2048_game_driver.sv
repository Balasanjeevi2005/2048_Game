class driver extends uvm_driver#(transactions);
  
  `uvm_component_utils(driver)
  game_if.DRV vif;
  
  function new(string name = "driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  task run_phase(uvm_phase phase);
    forever begin
      req.get_next_item();
      drive(req);
      req.seq_item_done();
    end
  endtask
  
  task drive(transactions tr);
    
    vif.ena <= tr.ena;
    vif.Ui_in <= tr.Ui_in;
    vif.Uio_in <= tr.Uio_in;
    vif.Rst_n <= tr.Rst_n;
    
    @(vif.drv_cb);
    
  endtask
  
endclass
