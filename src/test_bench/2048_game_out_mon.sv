class out_mon extends uvm_monitor;
  
  `uvm_component_utils(out_mon)
  game_if.OUT_MON vif;
  transactions tr;
  
  function new(string name = "out_mon",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  task run_phase(uvm_phase phase);
    
    tr = transactions::type_id::create("tr");
 
    tr.Uo_out  = vif.Uo_out;
    tr.Uio_out = vif.Uio_out;
    tr.Uio_oe  = vif.Uio_oe;

    tr.write();
    
  endtask
  
endclass
