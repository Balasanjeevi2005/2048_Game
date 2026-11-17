class environment extends uvm_environment;
  
  `uvm_component_utils(environment)
  inp_agent in_agnt;
  out_agent out_agnt;
  
  function new(string name = "environment",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    in_agnt = inp_agent::type_id::create("in_agnt");
    out_agnt = out_agent::type_id::create("out_agnt");
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    //drv.drv_port.connect();
  endfunction
  
endclass
