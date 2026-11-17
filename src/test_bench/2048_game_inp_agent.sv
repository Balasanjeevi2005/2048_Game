class inp_agent extends uvm_agent;
  
  `uvm_component_utils(driver)
  driver drv;
  inp_mon in_m;
  sequencer sqr;
  
  function new(string name = "driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv = driver::type_id::create("drv");
    in_m = inp_mon::type_id::create("in_m");
    sqr = sequencer::type_id::create("sqr");
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    //drv.drv_port.connect();
  endfunction
  
endclass
