class out_agent extends uvm_agent;
  
  `uvm_component_utils(driver)
  out_mon out_m;
  
  function new(string name = "out_agent",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    out_m = out_mon::type_id::create("out_m");
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    //drv.drv_port.connect();
  endfunction
  
endclass
