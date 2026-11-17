class inp_mon extends uvm_monitor;
  
  `uvm_component_utils(inp_mon)
  game_if.INP_MON vif;
  transactions tr;
  
  function new(string name = "inp_mon",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  task run_phase(uvm_phase phase);
    
    tr = transactions::type_id::create("tr");
    tr.ena    = vif.ena; 
    tr.Ui_in  = vif.Ui_in;
    tr.Uio_in = vif.Uio_in;
    tr.Rst_n  = vif.Rst_n;
    
    tr.write();
    
  endtask
  
endclass
