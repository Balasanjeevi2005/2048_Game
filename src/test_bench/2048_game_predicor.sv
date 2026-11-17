class game_predictor extends uvm_component;
  
  `uvm_component_utils(game_predictor)
  
  bit h_rst;
  
  bit[7:0]out;
  bit[:0]grid[0:3][0:3];
  bit[6:0]seed;
  bit tap;
  
  bit up;
  bit down;
  bit left;
  bit right;
  bit s_rst;
  
  function new(string name = "game_predictor",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  
  //hard reset
  task hard_reset();
    seed = 7'b000_0001;
    out  = 8'b1000_1000;
  endtask
  
  
  //normal operation
  task randomizer();
    tap = seed[1]^seed[6];
    seed = {seed[5:0],tap};
  endtask
  
  task normal_operation();
    if(s_rst)
      soft_reset();
    else 
      
  endtask
  
  task start();
    if(h_rst)
      hard_reset();
    else
      normal_operation();
  endtask
  
  
  
  task soft_reset();
    
  endtask
  
  
  
  
  
  
  task start_VGA();
    
  endtask
    
endclass
